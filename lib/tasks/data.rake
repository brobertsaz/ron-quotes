namespace :data do
  desc "Pull Ron Swanson Quotes API Data"
  task fetch_quotes: :environment do
    response = HTTParty.get('https://ron-swanson-quotes.herokuapp.com/v2/quotes/100')
    quotes = response.parsed_response

    quotes.each do |quote|
      record = Quote.find_or_initialize_by(text: quote)
      record.save
    end
  end
end
