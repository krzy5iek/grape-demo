# frozen_string_literal: true

Dir[File.join(Config.root_path, "app", "api", "v1", "*.rb")].each { |file| require(file) }

module API
  module V1
    class Base < Grape::API
      resource "customers" do
        mount API::V1::Customers
      end

      add_swagger_documentation hide_documentation_path: true,
        api_version: "v1",
        info: {
          title: "Application API V1",
          description: "Documentation for Application API V1"
        }
    end
  end
end
