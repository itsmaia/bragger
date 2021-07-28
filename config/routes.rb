Rails.application.routes.draw do
  authenticated :user do
    root :to => "dashboard#index", as: :authenticated_root
  end
  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    resources :users, only: %i[show edit update]
  end

  resources :entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homepage#index"
end
