Rails.application.routes.draw do
  resources :topics do
    # get 'posts/index'
    # get 'posts/show'
    # get 'posts/new'
    # get 'posts/edit'
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  # get 'welcome/about'
  get 'about' => 'welcome#about'

  # root({to: 'welcome#index'})
  # get 'welcome/index'
  root 'welcome#index'


end
