SampleApp::Application.routes.draw do

  resources :blogs

  get 'tags/:tag', to: 'static_pages#home', as: :tag
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :reviews do
    member { post :vote }
  end
  resources :relationships, only: [:create, :destroy]

  #match '/blog_entries' => 'blog_entries#show', :constraints => { :subdomain => /.+/ }
  root  to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/explore', to: 'static_pages#explore'
  match '/ramblings',   to: 'static_pages#blog'
  match '/blogs',   to: 'static_pages#blogs'
end
