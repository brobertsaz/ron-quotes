class Quote < ApplicationRecord
  validates_presence_of :text

  has_many :quote_reviews

  after_save :update_word_count

  private

  def update_word_count
    self.update_columns(word_count: text.split.length)
  end
end
