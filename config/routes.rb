Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get 'heroes', to: 'heroes#index'
  get 'heroes/:id', to: 'heroes#show'
  
  namespace :api do
    resources :a_passives, :b_passives, :c_passives, :assists, :specials, :weapons, :heroes, :skills
  end
end
