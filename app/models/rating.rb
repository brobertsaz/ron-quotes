class Rating < ApplicationRecord
  belongs_to :quote

  validates_presence_of :score, :rating_ip
  validates :rating_ip, uniqueness: { scope: :quote }
end
