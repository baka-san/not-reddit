Rails.application.routes.draw do
  # get 'advertisements/index'
  # get 'advertisements/show'
  # get 'advertisements/new'
  # get 'advertisements/create'
  resources :advertisements

  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/edit'
  resources :posts

  # get 'welcome/about'
  get 'about' => 'welcome#about'

  # root({to: 'welcome#index'})
  # get 'welcome/index'
  root 'welcome#index'

end
