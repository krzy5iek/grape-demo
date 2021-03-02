# frozen_string_literal: true

class ErrorHandler
  def initialize(error)
    @error = error
  end

  def error_body
    {
      error: {
        code: defined_error[:code],
        message: error.message,
      }
    }
  end

  def http_status
    defined_error[:http_status]
  end

  private

  attr_reader :error

  def defined_error
    @defined_error ||= DEFINED_ERRORS.fetch(error.class.to_s, DEFINED_ERRORS["ApplicationError"])
  end

  DEFINED_ERRORS = {
    "AuthenticationError" => {
      http_status: 401,
      code: 100,
    },
    "RecordNotFoundError" => {
      http_status: 404,
      code: 1050,
    },
    "ApplicationError" => {
      http_status: 500,
      code: 666,
    },
  }.freeze
end
