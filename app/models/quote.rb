class Quote < ApplicationRecord
  validates_presence_of :text

  has_many :ratings

  after_save :update_word_count

  def self.small_quotes
    where("word_count < 5")
  end

  def self.medium_quotes
    where("word_count > 4 and word_count < 13")
  end

  def self.large_quotes
    where("word_count > 12")
  end

  def average_rating
    scores = ratings.map(&:score)
    if scores.presence
      scores.sum.fdiv(scores.size)
    else
      'No votes yet'
    end
  end

  private

  def update_word_count
    self.update_columns(word_count: text.split.length)
  end
end
