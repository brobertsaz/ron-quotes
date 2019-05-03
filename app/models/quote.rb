class Quote < ApplicationRecord
  validates_presence_of :text

  has_many :quote_reviews
end
