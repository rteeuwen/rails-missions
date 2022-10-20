Rails.application.routes.draw do
  resources :logs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/fibonacci.json", to: "fibonacci#index"
  post "/fibonacci.json", to: "fibonacci#show"

end
