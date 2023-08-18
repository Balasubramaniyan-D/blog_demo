Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :blogposts do
    resources :comments
  end
  
  # get "blogposts/new", to: "blogposts#new", as: :new_blogpost
  # post "blogposts", to: "blogposts#create", as: :blogposts
  # get "blogposts/:id", to: "blogposts#show", as: :blogpost
  # get "blogposts/:id/edit", to: "blogposts#edit", as: :edit_blogpost
  # patch "blogposts/:id", to: "blogposts#update"
  # delete "blogposts/:id", to: "blogposts#destroy"
  get "my_post", to: "blogposts#my_post", as: :my_post

  root "blogposts#index"
end
