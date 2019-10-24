Rails.application.routes.draw do
  get 'joins/create'

  get 'joins/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  resources :groups
  resources :users, only: [:create]
  resources :joins, only: [:create, :destroy]

  # root GET    /                          sessions#new
  # sessions_new GET    /sessions/new(.:format)    sessions#new
  #     sessions POST   /sessions(.:format)        sessions#create
  #              DELETE /sessions/:id(.:format)    sessions#destroy
  #       groups GET    /groups(.:format)          groups#index
  #              POST   /groups(.:format)          groups#create
  #    new_group GET    /groups/new(.:format)      groups#new
  #   edit_group GET    /groups/:id/edit(.:format) groups#edit
  #        group GET    /groups/:id(.:format)      groups#show
  #              PATCH  /groups/:id(.:format)      groups#update
  #              PUT    /groups/:id(.:format)      groups#update
  #              DELETE /groups/:id(.:format)      groups#destroy
end
