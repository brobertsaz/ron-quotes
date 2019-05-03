Rails.application.routes.draw do

  resources :quote, only: :index do
    get :small_quotes, on: :collection
    get :medium_quotes, on: :collection
    get :large_quotes, on: :collection
    put :create_ranks, on: :member
  end
end
