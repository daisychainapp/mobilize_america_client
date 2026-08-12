module MobilizeAmericaClient
  class ResponseError < StandardError
    attr_reader :status, :headers, :body
    attr_accessor :rollbar_context

    def initialize(message, headers = nil, body = nil, status: nil)
      super(message)
      @headers = headers
      @body = body
      @status = status
    end
  end

  class NotFoundError < ResponseError; end
  class UnauthorizedError < ResponseError; end
  class BadRequestError < ResponseError
    attr_reader :error_data

    def initialize(message, error_data, headers = nil, body = nil, status: nil)
      super(message, headers, body, status:)
      @error_data = error_data
    end
  end

  class UnprocessableEntityError < ResponseError; end
  class RateLimitError < ResponseError; end

  # Raised when Mobilize responds with something other than the JSON object the
  # API documents, e.g. an HTML error or interstitial page from an intermediary.
  class UnexpectedResponseError < ResponseError; end
end
