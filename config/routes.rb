NairobiDevSchool::Application.routes.draw do
  devise_for :admins
  root to: "home#index"

  namespace :admin do
    resources :waiting_list_applications, only: :index
  end

  resources :waiting_list_applications, only: [:create, :new]
end
