Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get 'heroes', to: 'heroes#index'
  get 'heroes/:id', to: 'heroes#show'
  
  namespace :api do
    namespace :v1 do
      resources :a_passives, :b_passives, :c_passives, :assists, :specials, :weapons, :heroes, :skills, :hero_skills, :child_skills
      as :user do
        post   "/sign-in"       => "sessions#create"
        delete "/sign-out"      => "sessions#destroy"
      end
    end
  end
end
