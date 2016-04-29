Rails.application.routes.draw do
  resources :users,
            :words

  resources :attempts do
    post :check_word, on: :collection
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post 'create_word' => 'home#create_word', as: :create_word

  root 'home#index'
end
