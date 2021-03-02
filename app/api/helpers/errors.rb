# frozen_string_literal: true

module API
  module Helpers
    module Errors
      def respond_with_error(exception)
        error_handler = ErrorHandler.new(exception)

        rack_response(
          error_handler.error_body.to_json,
          error_handler.http_status,
          "Content-Type" => "application/json"
        )
      end
    end
  end
end
