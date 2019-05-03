class QuotesController < ApplicationController

  def index
  end

  def small_quotes
    Quote.where("word_count < 5")
  end

  def medium_quotes
    Quote.where("length > 4 and length < 13")
  end

  def large_quotes
    Quote.where("length > 12")
  end

end
