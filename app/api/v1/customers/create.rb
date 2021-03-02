# frozen_string_literal: true

module API
  module V1
    class Customers
      class Create < Grape::API
        params do
          requires :name, type: String, desc: "Name of customer"
          requires :age, type: Integer, desc: "Age of customer in years"
          optional :active, type: Boolean, desc: "Customer status"
        end

        post do
          repo = Customer::Repo.new
          service = Customer::CreateService.new(repo: repo)
          customer = service.call(**declared_params)

          present customer, with: API::Entities::Customer
        end
      end
    end
  end
end
