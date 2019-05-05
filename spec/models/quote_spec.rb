require 'rails_helper'

RSpec.describe Quote, type: :model do
  let!(:small)   { Quote.create(text: Faker::Lorem.sentence(4)) }
  let!(:medium)  { Quote.create(text: Faker::Lorem.sentence(7)) }
  let!(:large)   { Quote.create(text: Faker::Lorem.sentence(13)) }
  let!(:medium2) { Quote.create(text: Faker::Lorem.sentence(9)) }

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
    it 'returns the number of words in text' do
      expect(small.word_count).to eq 4
      expect(medium.word_count).to eq 7
      expect(large.word_count).to eq 13
    end
  end

  describe 'it returns correct quotes' do
    it "returns quotes with length less than 5" do
      expect(described_class.small_quotes).to contain_exactly(small)
    end

    it "returns quotes with length greater than 4 and less than 13" do
      expect(described_class.medium_quotes).to contain_exactly(medium, medium2)
    end

    it "returns quotes with length greater than 12" do
      expect(described_class.large_quotes).to contain_exactly(large)
    end
  end
end
