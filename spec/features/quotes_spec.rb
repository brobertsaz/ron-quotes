require 'rails_helper'

RSpec.describe "Quotes", type: :feature do
  let!(:small)   { Quote.create(text: Faker::Lorem.sentence(4)) }
  let!(:medium)  { Quote.create(text: Faker::Lorem.sentence(7)) }
  let!(:large)   { Quote.create(text: Faker::Lorem.sentence(13)) }

  describe "index page params" do
    it 'returns quotes with length less than 5' do
      visit quotes_path(size: 'small')
      expect(page).to have_content(small.text)
    end

    it 'returns quotes with length greater than 4 and less than 13' do
      visit quotes_path(size: 'medium')
      expect(page).to have_content(medium.text)
    end

    it 'returns quotes with length greater than 12' do
      visit quotes_path(size: 'large')
      expect(page).to have_content(large.text)
    end
  end

  describe "index page functions" do
    it 'returns quotes with length less than 5' do
      visit quotes_path
      click_link 'Small Quotes'
      expect(page).to have_content(small.text)
    end

    it 'returns quotes with length greater than 4 and less than 13' do
      visit quotes_path
      click_link 'Medium Quotes'
      expect(page).to have_content(medium.text)
    end

    it 'returns quotes with length greater than 12' do
      visit quotes_path
      click_link 'Large Quotes'
      expect(page).to have_content(large.text)
    end
  end

  describe "add rating" do
    it 'adds rating to quote', js: true do
      visit quotes_path
      first('.fa-star').click
      expect(page).to have_content("Successfully Rated Quote")
    end
  end
end
