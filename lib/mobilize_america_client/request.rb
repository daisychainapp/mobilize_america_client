require 'json'

module MobilizeAmericaClient
  module Request
    API_DOMAIN = 'api.mobilize.us'.freeze
    API_BASE_PATH = '/v1'.freeze

    def get(path:, params: {})
      request(method: :get, path:, params:)
    end

    def post(path:, body:)
      request(method: :post, path:, body:)
    end

    private

    def esc(untrusted)
      CGI.escape(untrusted.to_s)
    end

    def request(method:, path:, params: {}, body: {})
      response = connection.send(method) do |req|
        req.path = "#{API_BASE_PATH}#{path}"
        req.params = params
        req.headers['Content-Type'] = 'application/json'

        unless api_key.nil?
          req.headers['Authorization'] = "Bearer #{api_key}"
        end
        req.body = body unless body.empty?
      end

      raise_on_error_response(response)

      response.body
    end

    def raise_on_error_response(response)
      status = response.status
      headers = response.headers.to_h
      body = response.body

      case status
      when 400
        raise MobilizeAmericaClient::BadRequestError.new(body, body['error'], headers, body, status:)
      when 401
        raise MobilizeAmericaClient::UnauthorizedError.new('Unauthorized', headers, body, status:)
      when 404
        raise MobilizeAmericaClient::NotFoundError.new('Not Found', headers, body, status:)
      when 422
        raise MobilizeAmericaClient::UnprocessableEntityError.new('Unprocessable Entity', headers, body, status:)
      when 429
        raise MobilizeAmericaClient::RateLimitError.new('Rate limit exceeded', headers, body, status:)
      end

      # Mobilize also signals rate limiting in the body of an otherwise successful response.
      if body.is_a?(Hash) && body['error'] == 'rate-limited'
        raise MobilizeAmericaClient::RateLimitError.new('Rate limit exceeded', headers, body, status:)
      end

      unless response.success?
        raise MobilizeAmericaClient::ResponseError.new("Unexpected HTTP status #{status}", headers, body, status:)
      end

      unless body.is_a?(Hash)
        raise MobilizeAmericaClient::UnexpectedResponseError.new("Unexpected non-JSON response (HTTP #{status})", headers, body, status:)
      end
    end
  end
end
