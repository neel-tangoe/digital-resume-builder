Rails.application.routes.draw do
  #get 'home/index'

  devise_for :users,controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'}

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_out", to: "devise/sessions#destroy"
    get "sign_up", to: "devise/registrations#new"
    get "forgot_password", to: "devise/passwords#new"
  end
  
  resources :resumes
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :sessions, only: [:create]
  
  root "home#index"

end

