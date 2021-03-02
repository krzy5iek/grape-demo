# frozen_string_literal: true

class CustomersRepo
  class << self
    def find!(id:)
      customer_app_client.get(id: id).data
    rescue CustomerApp::RecordNotFound
      raise RecordNotFoundError, "Customer with id=#{id} doesn't exist"
    end

    private

    def customer_app_client
      @customer_app_client ||= CustomerApp::Adapter.new
    end
  end
end
