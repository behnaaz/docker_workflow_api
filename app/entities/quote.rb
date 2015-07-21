module Example
  module Entities
    class Quote < Grape::Entity
      expose :text
    end
  end
end