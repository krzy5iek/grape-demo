# frozen_string_literal: true

class CustomersService
  class << self
    def get(id:)
      CustomersRepo.find!(id: id.to_i)
    end
  end
end
