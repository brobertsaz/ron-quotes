class QuoteReview < ApplicationRecord
  belongs_to :quote

  validates_presence_of :rating, :rating_ip
  validates :rating_ip, uniqueness: { scope: :quote }
end
