Rails.application.routes.draw do
  get 'test/index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  #get 'search' => 'search#index', as: :search

  root to: 'home#index'
end
