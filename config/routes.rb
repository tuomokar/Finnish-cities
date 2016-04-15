Rails.application.routes.draw do

  scope "(:locale)", locale: /en|fi/ do
    resources :regions
    resources :municipalities
    resources :users
  end

  # root with locale
  get '/:locale' => 'regions#index'

  root 'regions#index'
end
