Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get 'heroes', to: 'heroes#index'
  get 'heroes/:id', to: 'heroes#show'
end
