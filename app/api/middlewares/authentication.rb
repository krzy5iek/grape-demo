# frozen_string_literal: true

module Middlewares
  class Authentication < Grape::Middleware::Auth::Base
    def call(env)
      raise AuthenticationError, "You are not authorized!" unless env["HTTP_AUTHORIZATION"] == "Base 123"

      @app.call(env)
    end
  end
end
