# frozen_string_literal: true

module API
  module Helpers
    module Params
      def declared_params
        @declared_params ||= declared(params).to_h.deep_symbolize_keys!
      end
    end
  end
end
