Rails.application.routes.draw do
  # get 'questions/new'
  # get 'questions/create'
  # get 'questions/update'
  # get 'questions/edit'
  # get 'questions/destroy'
  # get 'questions/index'
  # get 'questions/show'
  resources :questions

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
