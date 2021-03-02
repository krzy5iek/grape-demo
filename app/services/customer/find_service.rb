# frozen_string_literal: true

module Customer
  class FindService
    def initialize(repo:)
      @repo = repo
    end

    def call(id:)
      @repo.find!(id: id.to_i)
    end
  end
end
