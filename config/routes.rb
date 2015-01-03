Rails.application.routes.draw do

  resources :purchases, except: [:show, :edit, :update]
  resources :lemonade_types, except: [:show]

  root 'purchases#index'

end
