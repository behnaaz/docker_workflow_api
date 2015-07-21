class Quote
  include Mongoid::Document
  field :text, type: String
end