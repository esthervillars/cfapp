Rails.application.routes.draw do
  
  resources :users
  resources :products

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'

 

  # root 'welcome#index'
  root 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

