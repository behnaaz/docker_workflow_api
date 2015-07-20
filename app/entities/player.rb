module Example
  module Entities
    class Player < Grape::Entity
      expose :name
    end
  end
end