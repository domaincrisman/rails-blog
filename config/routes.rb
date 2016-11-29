  Rails.application.routes.draw do
  

  namespace :admin do
    get 'posts/index'
  end

  namespace :admin do
    get 'posts/new'
  end

  namespace :admin do
    get 'posts/create'
  end

  namespace :admin do
    get 'posts/edit'
  end

  namespace :admin do
    get 'posts/update'
  end

  namespace :admin do
    get 'posts/show'
  end

  namespace :admin do
    get 'posts/destroy'
  end

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'

  namespace :admin do
    resources :posts
    resources :sessions, only: [:new, :create, :destroy]
    resources :moderators, only: [:index, :edit, :update]
  end
end
