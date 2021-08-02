Rails.application.routes.draw do
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
    resources :entries
    resources :anki_subentries
    resources :immersion_subentries
    resources :reading_subentries
  end

  resources :support_us, only: :index

  if Rails.env.production?
    devise_for :users, controllers: { registrations: "registrations" }
  else
    devise_for :users
    devise_scope :user do
      get "/users/sign_out" => "devise/sessions#destroy"
      resources :users, only: %i[show edit update]
    end
  end

  root to: "homepage#index"
end
