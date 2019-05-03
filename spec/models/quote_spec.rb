require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'requires text' do
    it 'fails with no text' do
      quote = Quote.create
      expect(quote.save).to be false
    end

    it 'succeeds with text' do
      quote = Quote.create text: Faker::TvShows::SouthPark.quote
      expect(quote.save).to be true
    end
  end

  describe 'word count' do
    let!(:small)   { Quote.create(text: Faker::Lorem.sentence(4)) }
    let!(:medium)  { Quote.create(text: Faker::Lorem.sentence(7)) }
    let!(:large)   { Quote.create(text: Faker::Lorem.sentence(13)) }

    it 'returns the number of words in text' do
      expect(small.word_count).to eq 4
      expect(medium.word_count).to eq 7
      expect(large.word_count).to eq 13
    end
  end
end
