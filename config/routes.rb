FancyGallery::Application.routes.draw do
  resources :galleries do
    resources :photos, :only => [:create, :destroy]
  end

  devise_for :users
  resources :users do 
    resources :roles
  end

  resources :posts


  root :to => 'high_voltage/pages#show', :id => 'front'

end
