# frozen_string_literal: true

module Customer
  class CreateService
    def initialize(repo:)
      @repo = repo
    end

    def call(attributes)
      @repo.create!(attributes)
    end
  end
end
