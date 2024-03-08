module MobilizeAmericaClient
  class NotFoundError < StandardError; end
  class UnauthorizedError < StandardError; end
  class BadRequestError < StandardError
    attr_reader :error_data

    def initialize(message, error_data)
      # Call the parent's constructor to set the message
      super(message)

      # Store the action in an instance variable
      @error_data = error_data
    end

  end

  class UnprocessableEntityError < StandardError; end
end
