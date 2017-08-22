Rails.application.routes.draw do
  # get 'welcome/index'
  get 'welcome#index'

  get 'welcome/about'

  # root({to: 'welcome#index'})
  root 'welcome#index'

end
