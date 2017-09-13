Rails.application.routes.draw do
  resources :topics do
    # get 'posts/index'
    # get 'posts/show'
    # get 'posts/new'
    # get 'posts/edit'
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end



  # get 'welcome/about'
  get 'about' => 'welcome#about'

  # root({to: 'welcome#index'})
  # get 'welcome/index'
  root 'welcome#index'

end
