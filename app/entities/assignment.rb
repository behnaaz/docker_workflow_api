require_relative 'hint'
require_relative 'extra_assignment'

module PoliceExperience
  module Entities
    class Assignment < Grape::Entity
      expose :question
      expose :description
      expose :points
      expose :id
      expose :placeholder_answer
      expose :active_hint, with: PoliceExperience::Entities::Hint
      expose :answer, if: { done: true }
      expose :extra_assignment, with: PoliceExperience::Entities::ExtraAssignment, unless: :old
    end
  end
end