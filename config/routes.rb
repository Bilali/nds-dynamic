NairobiDevSchool::Application.routes.draw do
  root to: "home#index"

  resources :waiting_list_applications, only: [:create, :new]

end
