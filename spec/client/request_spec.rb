require 'spec_helper'

RSpec.describe MobilizeAmericaClient::Request do
  let(:api_key) { 'abcde-123456' }
  let(:base_url) { "https://#{MobilizeAmericaClient::Client::API_DOMAIN}#{MobilizeAmericaClient::Client::API_BASE_PATH}" }
  let(:org_id) { 123 }
  let(:url) { "#{base_url}/organizations/#{org_id}/attendances" }
  let(:json_headers) { {'Content-Type' => 'application/json'} }

  subject { MobilizeAmericaClient::Client.new(api_key: api_key) }

  def get_attendances
    subject.organization_attendances(organization_id: org_id)
  end

  it 'should expose the response status on the error' do
    stub_request(:get, url).to_return(status: 404, body: {error: 'not found'}.to_json, headers: json_headers)

    expect { get_attendances }.to raise_error(MobilizeAmericaClient::NotFoundError) do |error|
      expect(error.status).to eq(404)
      expect(error.body).to eq({'error' => 'not found'})
    end
  end

  it 'should raise a rate limit error on a 429' do
    stub_request(:get, url).to_return(status: 429, body: {error: 'rate-limited'}.to_json, headers: json_headers.merge('retry-after' => '30'))

    expect { get_attendances }.to raise_error(MobilizeAmericaClient::RateLimitError) do |error|
      expect(error.status).to eq(429)
      expect(error.headers['retry-after']).to eq('30')
    end
  end

  it 'should raise a rate limit error when the body says so' do
    stub_request(:get, url).to_return(status: 200, body: {error: 'rate-limited'}.to_json, headers: json_headers)

    expect { get_attendances }.to raise_error(MobilizeAmericaClient::RateLimitError) do |error|
      expect(error.status).to eq(200)
    end
  end

  it 'should raise on an otherwise unhandled status' do
    stub_request(:get, url).to_return(status: 503, body: {error: 'unavailable'}.to_json, headers: json_headers)

    expect { get_attendances }.to raise_error(MobilizeAmericaClient::ResponseError, 'Unexpected HTTP status 503') do |error|
      expect(error.status).to eq(503)
    end
  end

  it 'should raise when the response is not JSON' do
    html = '<!DOCTYPE html><html lang="en"><head><title>Please wait...</title></head></html>'
    stub_request(:get, url).to_return(status: 200, body: html, headers: {'Content-Type' => 'text/html'})

    expect { get_attendances }.to raise_error(MobilizeAmericaClient::UnexpectedResponseError, 'Unexpected non-JSON response (HTTP 200)') do |error|
      expect(error.status).to eq(200)
      expect(error.body).to eq(html)
    end
  end
end
