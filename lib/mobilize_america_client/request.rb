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

      if response.status == 401
        raise MobilizeAmericaClient::UnauthorizedError
      end

      if response.status == 404
        raise MobilizeAmericaClient::NotFoundError
      end

      if response.status == 400
        raise MobilizeAmericaClient::BadRequestError.new(response.body, response.body['error'])
      end

      if response.status == 422
        raise MobilizeAmericaClient::UnprocessableEntityError, response.body
      end

      # Check for rate limiting in response body
      if response.body.is_a?(Hash) && response.body['error'] == 'rate-limited'
        raise MobilizeAmericaClient::RateLimitError.new('Rate limit exceeded', response.headers.to_h)
      end

      response.body
    end
  end
end
