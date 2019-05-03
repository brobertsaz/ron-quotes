require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'requires text' do
    it 'fails with no text' do
      quote = Quote.create
      expect(quote.save).to eq false
    end

    it 'succeeds with text' do
      quote = Quote.create text: Faker::TvShows::SouthPark.quote
      expect(quote.save).to eq true
    end
  end
end
