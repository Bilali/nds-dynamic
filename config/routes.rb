NairobiDevSchool::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'logout', to: 'devise/sessions#destroy', as: 'logout'
  end

  root to: "home#index"
  get "/programs" => "home#programs"
  get "/supporters" => "home#supporters"
  get "/about" => "home#about_us"

  resources :sponsor_applications, only: [:new, :create]
  resources :waiting_list_applications, only: [:create, :new]
  resources :mentor_applications, only: [:create, :new]
  resources :attendee_applications, only: [:create, :new]
end
