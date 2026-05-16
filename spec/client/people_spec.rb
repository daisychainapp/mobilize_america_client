require 'spec_helper'

RSpec.describe MobilizeAmericaClient::Client::People do
  let(:api_key) { 'abcde-123456' }
  let(:expected_headers) { {'Content-Type' => 'application/json', 'Authorization' => "Bearer #{api_key}"} }
  let(:base_url) { "https://#{MobilizeAmericaClient::Client::API_DOMAIN}#{MobilizeAmericaClient::Client::API_BASE_PATH}" }

  subject { MobilizeAmericaClient::Client.new(api_key: api_key) }

  describe '#organization_people' do
    let(:org_id) { 123 }
    let(:people_url) { "#{base_url}/organizations/#{org_id}/people" }
    let(:response) { {'data' => [{'id' => 1, 'given_name' => 'Alice'}, {'id' => 2, 'given_name' => 'Bob'}]} }
    let(:response_headers) { {'Content-Type' => 'application/json'} }

    it 'should raise if response status is 401' do
      stub_request(:get, people_url).with(headers: expected_headers).to_return(status: 401, body: {error: 'unauthorized'}.to_json)

      expect { subject.organization_people(organization_id: org_id) }.to raise_error MobilizeAmericaClient::UnauthorizedError
    end

    it 'should raise if response status is 404' do
      stub_request(:get, people_url).with(headers: expected_headers).to_return(status: 404, body: {error: 'not found'}.to_json)

      expect { subject.organization_people(organization_id: org_id) }.to raise_error MobilizeAmericaClient::NotFoundError
    end

    it 'should call the endpoint and return JSON' do
      stub_request(:get, people_url).with(headers: expected_headers).to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_people(organization_id: org_id)).to eq(response)
    end

    it 'should escape the organization ID' do
      expected_url = "#{base_url}/organizations/foo%2Fbar/people"
      stub_request(:get, expected_url).with(headers: expected_headers).to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_people(organization_id: 'foo/bar')).to eq(response)
    end

    it 'should support an updated_since parameter' do
      updated_since = Time.new
      stub_request(:get, people_url)
        .with(headers: expected_headers, query: {updated_since: updated_since.to_i})
        .to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_people(organization_id: org_id, updated_since: updated_since)).to eq(response)
    end

    it 'should support a cursor parameter' do
      stub_request(:get, people_url)
        .with(headers: expected_headers, query: {cursor: 'abc123'})
        .to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_people(organization_id: org_id, cursor: 'abc123')).to eq(response)
    end

    it 'should support pagination parameters' do
      stub_request(:get, people_url)
        .with(headers: expected_headers, query: {page: 2, per_page: 100})
        .to_return(body: response.to_json, headers: response_headers)
      expect(subject.organization_people(organization_id: org_id, page: 2, per_page: 100)).to eq(response)
    end
  end
end
