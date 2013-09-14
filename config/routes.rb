NairobiDevSchool::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'logout', to: 'devise/sessions#destroy', as: 'logout'
  end

  root to: "home#index"
  get "/programs" => "home#programs"
  get "/supporters" => "home#supporters"
  get "/about" => "home#about_us"

  namespace :admin do
    resources :attendee_applications, only: :index
    resources :mentor_applications, only: :index
    resources :sponsor_applications, only: :index
  end

	resources :sponsor_applications, only: [:new, :create]
  resources :waiting_list_applications, only: [:create, :new]
  resources :mentor_applications, only: [:create, :new]
  resources :attendee_applications, only: [:create, :new]
end
