# frozen_string_literal: true

module API
  module V1
    class Customers
      class Show < Grape::API
        params do
          requires :id, type: Integer, desc: "ID of customer"
        end

        get do
          repo = Customer::Repo.new
          service = Customer::FindService.new(repo: repo)
          customer = service.call(**declared_params)

          present customer, with: API::Entities::Customer
        end
      end
    end
  end
end
