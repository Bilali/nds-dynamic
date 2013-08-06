NairobiDevSchool::Application.routes.draw do
  devise_for :users
  root to: "home#index"

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
