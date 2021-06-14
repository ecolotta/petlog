Rails.application.routes.draw do
  root 'home#index'

  namespace :api, format: 'json' do
    post "oauth/callback", to: "oauths#callback"
    get "oauth/callback", to: "oauths#callback"
    get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  end
end
