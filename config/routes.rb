Rails.application.routes.draw do
  resources :topics do
    # get 'posts/index'
    # get 'posts/show'
    # get 'posts/new'
    # get 'posts/edit'
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  # get '/users/confirm' => 'user#confirm'
  post 'users/confirm' => 'users#confirm'

  # get 'welcome/about'
  get 'about' => 'welcome#about'

  # root({to: 'welcome#index'})
  # get 'welcome/index'
  root 'welcome#index'



end
