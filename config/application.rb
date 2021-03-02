# frozen_string_literal: true

require File.expand_path("../config/environment", __dir__)

Dir[File.join(Config.root_path, "config", "initializers", "*.rb")].each { |file| require(file) }
Dir[File.join(Config.root_path, "app", "api", "entities", "*.rb")].each { |file| require(file) }
Dir[File.join(Config.root_path, "app", "lib", "*.rb")].each { |file| require(file) }
Dir[File.join(Config.root_path, "app", "models", "*.rb")].each { |file| require(file) }
Dir[File.join(Config.root_path, "app", "repositories", "*.rb")].each { |file| require(file) }
Dir[File.join(Config.root_path, "app", "services", "*.rb")].each { |file| require(file) }

require "app/api/base"

module Application
  extend self

  def run
    Rack::Builder.app do
      # use App::Midleware::ExceptionHandler

      run API::Base
    end
  end
end
