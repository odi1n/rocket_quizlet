Rails.application.routes.draw do
    get 'tests/index'
    get 'test/index'
    devise_for :users
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount Ckeditor::Engine => '/ckeditor'

    #get 'search' => 'search#index', as: :search

    root to: 'home#index'

    resources :test_report, only: [:create, :edit, :update]

    resources :categories do
        resources :test_case, only: [:show], path: "test"
        get "/open", to: "categories#open"
    end
end
