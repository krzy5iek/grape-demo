# frozen_string_literal: true

module API
  module V1
    class Customers < Grape::API
      require_relative "customers/create"
      require_relative "customers/show"

      mount Customers::Create

      route_param :id, type: String do
        mount Customers::Show
      end
    end
  end
end
