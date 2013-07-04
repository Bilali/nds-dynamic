NairobiDevSchool::Application.routes.draw do
  devise_for :admins
  root to: "home#index"

  namespace :admin do
    resources :waiting_list_applications, only: :index
    # don't let admins create accounts
    ## TODO
    # --- some thoughts
    # suppose we used cancan to define roles
    # 1) Student role (waiting "listed")
    # 2) Admin Role (assignable using a console e.g.)
    # 3) other roles? sponsor? contributor? etc.
  end

  resources :waiting_list_applications, only: [:create, :new]
end
