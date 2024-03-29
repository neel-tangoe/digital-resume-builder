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
  
  resources :resumes do
    member do
      get 'download'
      delete 'delete_attachment'
      get 'choose_your_template'
      get 'share'
      get 'choose_template_to_be_downloaded'
      get 'show'
    end
    collection do
      get 'choose_templates'
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :sessions, only: [:create]
  
  root "home#index"
end

