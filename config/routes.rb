Rails.application.routes.draw do

  root 'quotes#index'

  resources :quotes, only: :index do
    put :add_rating, on: :member
  end
end
