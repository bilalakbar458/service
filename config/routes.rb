Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: "login", sign_up: "register", sign_out: "logout"}
  resources :businesses
  resources :tasks

  get 'pages/home', to: "pages#home"


  get "member-area", to: "pages#member_area"
  get "admin_space", to: "pages#admin_space"

  get "after_sign_in_path_for", to: "pages#test"
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
