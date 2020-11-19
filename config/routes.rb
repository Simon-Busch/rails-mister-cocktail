Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cocktails do
    resources :doses, only: [:create, :destroy]
  end
  resources :ingredients, only: [:create]
end
