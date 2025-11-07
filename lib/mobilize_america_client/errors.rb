module MobilizeAmericaClient
  class ResponseError < StandardError
    attr_reader :headers, :body

    def initialize(message, headers = nil, body = nil)
      super(message)
      @headers = headers
      @body = body
    end
  end

  class NotFoundError < ResponseError; end
  class UnauthorizedError < ResponseError; end
  class BadRequestError < ResponseError
    attr_reader :error_data

    def initialize(message, error_data, headers = nil, body = nil)
      super(message, headers, body)
      @error_data = error_data
    end
  end

  class UnprocessableEntityError < ResponseError; end
  class RateLimitError < ResponseError; end
end
