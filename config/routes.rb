Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  # Sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :posts do
    post "/images", to: "ebooks#create_image", as: "images"
    delete "/images/:id", to: "ebooks#delete_image", as: "image"
  end

  resources :ebooks do
    post "/image", to: "ebooks#create_image", as: "image"
    delete "/image", to: "ebooks#delete_image"
    post "/attachments", to: "ebooks#create_attachment", as: "attachments"
    delete "/attachment/:id", to: "ebooks#destroy_attachment", as: "attachment"
  end
end
