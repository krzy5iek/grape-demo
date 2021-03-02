# frozen_string_literal: true

module API
  module V1
    class Customers
      class Create < Grape::API
        post do
          status 201
          {}
        end
      end
    end
  end
end
