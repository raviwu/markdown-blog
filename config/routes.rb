Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  # Sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/posts_search", to: "posts#search", as: "posts_search"

  resources :posts do
    post "/images", to: "posts#create_image", as: "images"
    delete "/images/:id", to: "posts#destroy_image", as: "image"
  end

  resources :ebooks do
    post "/image", to: "ebooks#create_image", as: "image"
    delete "/image", to: "ebooks#destroy_image"
    post "/attachments", to: "ebooks#create_attachment", as: "attachments"
    delete "/attachment/:id", to: "ebooks#destroy_attachment", as: "attachment"
  end

  resources :pages, except: [:index] do
    post "/image", to: "pages#create_image", as: "images"
    delete "/image/:id", to: "pages#destroy_image", as: "image"
  end
end
