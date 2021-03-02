# frozen_string_literal: true

module CustomerApp
  class RecordNotFound < StandardError; end

  class Adapter
    CUSTOMERS = [
      { id: 1, name: "Geralt", age: 50, active: true },
      { id: 2, name: "Neo", age: 30, active: false },
      { id: 3, name: "Adam", age: 40, active: true },
      { id: 4, name: "John", age: 60, active: true },
      { id: 5, name: "Walt", age: 70, active: true },
    ].freeze

    def get(params)
      customer = CUSTOMERS.find { |c| c[:id] == params[:id] }

      return success_response(customer, 200) if customer

      raise CustomerApp::RecordNotFound, "Customer not found"
    end

    private

    def success_response(data, http_status)
      OpenStruct.new(
        data: data,
        status: http_status,
      )
    end
  end
end
