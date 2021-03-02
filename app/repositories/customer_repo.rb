# frozen_string_literal: true

module Customer
  class Repo
    def find!(id:)
      customer_app_client.get(id: id).data
    rescue CustomerApp::RecordNotFound
      raise RecordNotFoundError, "Customer with id=#{id} doesn't exist"
    end

    def create!(attributes)
      customer_app_client.post(attributes).data
    rescue CustomerApp::RecordInvalid => e
      raise RecordInvalidError, e.message
    end

    private

    def customer_app_client
      @customer_app_client ||= CustomerApp::Adapter.new
    end
  end
end
