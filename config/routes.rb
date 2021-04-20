Rails.application.routes.draw do
    get 'tests/index'
    get 'test/index'
    devise_for :users
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount Ckeditor::Engine => '/ckeditor'

    #get 'search' => 'search#index', as: :search

    root to: 'home#index'

    resources :categories do
        get "tests/:id", to: "tests#show", as: "tests"
        post "tests/:id", to: "tests#create"
    end
end
