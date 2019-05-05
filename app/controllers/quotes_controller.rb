class QuotesController < ApplicationController

  def index
    @quote =  case params[:size]
              when 'small'
                Quote.small_quotes
              when 'medium'
                Quote.medium_quotes
              when 'large'
                Quote.large_quotes
              else
                Quote.all
              end.sample
  end

  def add_rating
    @quote = Quote.find params[:id]
    @rating = @quote.ratings.create(score: params[:rating], rating_ip: request.ip)

    if @rating.save
      flash[:success] = "Successfully Rated Quote"
    else
      flash[:success] = @rating.errors.full_messages.join(' ')
    end
    render 'index'
  end
end
