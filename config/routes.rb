Rails.application.routes.draw do
  resources :messages, only: [:index, :new, :create]
  get '/view' => 'messages#index'
  post '/view' => 'messages#index'
  get '/form' => 'messages#new'
end
