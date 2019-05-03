require 'rails_helper'

RSpec.describe QuoteReview, type: :model do
  let!(:quote) { Quote.create text: Faker::TvShows::SouthPark.quote }
  let!(:review) { QuoteReview.create(quote: quote, rating_ip: "1234", rating: 4 )}

  describe 'has required fields' do
    it 'fails with no rating' do
      quote_review = QuoteReview.create(quote: quote, rating_ip: Faker::Internet.ip_v4_address )
      expect(quote_review.save).to be false
    end

    it 'fails with no ip' do
      quote_review = QuoteReview.create(quote: quote, rating: 5 )
      expect(quote_review.save).to be false
    end

    it 'fails with no quote' do
      quote_review = QuoteReview.create(rating_ip: Faker::Internet.ip_v4_address, rating: 2 )
      expect(quote_review.save).to be false
    end

    it 'succeeds with rating, ip, and quote' do
      quote_review = QuoteReview.create(quote: quote, rating_ip: Faker::Internet.ip_v4_address, rating: 4 )
      expect(quote_review.save).to be true
    end
  end

  it 'restricts multiple ratings per ip' do
    new_review = QuoteReview.create(quote: quote, rating_ip: "1234", rating: 3 )
    expect(new_review.save).to be false
  end
end
