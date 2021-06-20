Rails.application.routes.draw do
  root 'home#index'

  namespace :api, format: 'json' do
    resources :sessions, only: %i[destroy]
    resources :users, only: %i[create], shallow: true do
      resources :dogs, only: %i[create]
    end
    get "me", to: "users#me"
    get "my_dog", to: "dogs#me"
    post 'webhook' => "linebot#webhook"
    post "oauth/callback", to: "oauths#callback"
    get "oauth/callback", to: "oauths#callback"
    get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  end
end
