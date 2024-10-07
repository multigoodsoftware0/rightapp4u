Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :profiles
  resources :orders, only: [:index,:show]
  resources :products
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, on: :member
  end
  namespace :account do
    resources :orders, only: [:index, :show] do
      get :refund
      # get :invoice
    end
  end
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'pages#about', as: :pages_about
  get '/pages/about', to: redirect('/about')
  get '/contact', to: 'pages#contact', as: :pages_contact
  get '/pages/contact', to: redirect('/contact')
  get '/terms', to: 'pages#terms', as: :pages_terms
  get '/pages/terms', to: redirect('/terms')
  get '/privacy', to: 'pages#privacy', as: :pages_privacy
  get '/pages/privacy', to: redirect('/privacy')
  get '/careers', to: 'pages#careers', as: :pages_careers
  get '/pages/careers', to: redirect('/careers')
  get '/business', to: 'pages#business', as: :pages_business
  get '/pages/business', to: redirect('/business')
  get '/account', to: "pages#account", as: :account
  get '/browse', to: "products#index", as: :browse
  get "/blog", to: redirect('https://www.rightapp4u.com/blog/', status: 301)
  post '/purchase' => 'orders#purchase_status'
  # get "refund/:id", to: "orders#refund"
  mount Commontator::Engine => '/comments'
  root 'products#index'
end
