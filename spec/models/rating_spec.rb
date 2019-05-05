require 'rails_helper'

RSpec.describe Rating, type: :model do
  let!(:quote) { Quote.create text: Faker::TvShows::SouthPark.quote }

  describe 'has required fields' do
    it 'fails with no rating' do
      rating = Rating.create(quote: quote, rating_ip: Faker::Internet.ip_v4_address )
      expect(rating.save).to be false
    end

    it 'fails with no ip' do
      rating = Rating.create(quote: quote, score: 5 )
      expect(rating.save).to be false
    end

    it 'fails with no quote' do
      rating = Rating.create(rating_ip: Faker::Internet.ip_v4_address, score: 2 )
      expect(rating.save).to be false
    end

    it 'succeeds with rating, ip, and quote' do
      rating = Rating.create(quote: quote, rating_ip: Faker::Internet.ip_v4_address, score: 4 )
      expect(rating.save).to be true
    end
  end

  it 'restricts multiple ratings per ip' do
    old_review = Rating.create(quote: quote, rating_ip: "1234", score: 2 )
    new_review = Rating.create(quote: quote, rating_ip: "1234", score: 3 )
    expect(new_review.save).to be false
  end
end
