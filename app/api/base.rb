# frozen_string_literal: true

require "grape-swagger"
require "grape-swagger/entity"
require "app/api/helpers/errors"
require "app/api/helpers/params"
require "app/api/middlewares/authentication"
require "app/api/v1/base"

module API
  class Base < Grape::API
    content_type :json, "application/json"
    default_format :json

    helpers API::Helpers::Errors
    helpers API::Helpers::Params

    rescue_from(:all) { |exception| respond_with_error(exception) }

    Grape::Middleware::Auth::Strategies.add(:token_auth, Middlewares::Authentication)

    auth :token_auth

    namespace "/v1" do
      insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger

      mount API::V1::Base
    end
  end
end
