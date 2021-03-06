# frozen_string_literal: true

module API
  module Entities
    class Customer < Grape::Entity
      expose :id,     documentation: { type: "Integer", desc: "Customer ID" }
      expose :name,   documentation: { type: "String", desc: "Customer name" }
      expose :age,    documentation: { type: "Integer", desc: "Customer age in years" }
      expose :active, documentation: { type: "Boolean", desc: "Customer activity flag" }
    end
  end
end
