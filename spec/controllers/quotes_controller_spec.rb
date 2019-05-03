require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  let!(:small)   { Quote.create(text: Faker::Lorem.sentence(4)) }
  let!(:medium)  { Quote.create(text: Faker::Lorem.sentence(7)) }
  let!(:large)   { Quote.create(text: Faker::Lorem.sentence(13)) }
  let!(:medium2) { Quote.create(text: Faker::Lorem.sentence(9)) }

  describe 'it returns correct quotes' do
    it "should only return quotes with length less than 5" do
      expect(subject.small).to contain_exactly(small)
    end

    it "should only return quotes with length greater than 4 and less than 13" do
      expect(subject.medium).to contain_exactly(medium, medium2)
    end

    it "should only return quotes with length greater than 12" do
      expect(subject.large).to contain_exactly(large)
    end
  end
end
