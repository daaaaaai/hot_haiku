Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: 'haikus#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'term' => 'static_pages#term'
  resources :haikus, only: [:show, :index, :create] do
    # もっとシュッとした書き方ないだろうか・・・
    post "like" => "haikus/likes#create"
  end

  resource :comment, only: :create
end
