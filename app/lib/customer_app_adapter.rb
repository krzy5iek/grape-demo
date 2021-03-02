# frozen_string_literal: true

module CustomerApp
  class RecordNotFound < StandardError; end
  class RecordInvalid < StandardError; end

  class Adapter
    CUSTOMERS = [
      { id: 1, name: "Geralt", age: 50, active: true },
      { id: 2, name: "Neo", age: 30, active: false },
      { id: 3, name: "Adam", age: 40, active: true },
      { id: 4, name: "John", age: 60, active: true },
      { id: 5, name: "Walt", age: 70, active: true },
    ].freeze

    def get(params)
      customer = find_customer(:id, params[:id])

      return success_response(customer, 200) if customer

      raise CustomerApp::RecordNotFound, "Customer not found"
    end

    def post(params)
      customer = find_customer(:name, params[:name])

      raise CustomerApp::RecordInvalid, "Customer with given name already exists" if customer

      success_response(params, 200)
    end

    private

    def find_customer(attribute, value)
      CUSTOMERS.find { |c| c[attribute] == value }
    end

    def success_response(data, http_status)
      OpenStruct.new(
        data: data,
        status: http_status,
      )
    end
  end
end
