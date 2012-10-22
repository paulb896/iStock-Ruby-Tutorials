Tutorial2::Application.routes.draw do
  resources :authors

  root :to => 'articles#index'
  get "tags/index"

  get "tags/show"

  resources :articles
  resources :comments
  resources :tags
  
  resources :author_sessions

  match 'login'  => 'author_sessions#new',     :as => :login
  match 'logout' => 'author_sessions#destroy', :as => :logout

  match ':articles/:byMonth/:month' => 'articles#byMonth', :as => :filterByMonth

end
