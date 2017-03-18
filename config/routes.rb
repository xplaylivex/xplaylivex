Rails.application.routes.draw do
  default_url_options host: 'localhost', port: 3000
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root to: "home#index"

  resources :links, only: [:index]
  resources :games, only: [:index]
  resources :videos, only: [:index, :show]
  get 'videos/category/:category_id' => 'videos#showCategory', as: 'video_categories'
  resources :newsletter_subscriptions, only: [ :create ]

  get '/admin' => 'admin#index', as: 'admin'

  get '/admin/users' => 'admin#user_index', as: 'admin_users'
  get '/admin/users/:id/edit' => 'admin#user_edit', as: 'admin_user_edit'
  patch '/admin/users/:id/update' => 'admin#user_update', as: 'admin_user_update'

  get '/admin/games' => 'admin#game_index', as: 'admin_games'
  get '/admin/games/new' => 'admin#game_new', as: 'admin_game_new'
  put '/admin/games/create' => 'admin#game_create', as: 'admin_game_create'
  get '/admin/games/:id/edit' => 'admin#game_edit', as: 'admin_game_edit'
  patch '/admin/games/:id/update' => 'admin#game_update', as: 'admin_game_update'

  get '/admin/videos' => 'admin#video_index', as: 'admin_videos'
  get '/admin/videos/new' => 'admin#video_new', as: 'admin_video_new'
  put '/admin/videos/create' => 'admin#video_create', as: 'admin_video_create'
  get '/admin/videos/:id/edit' => 'admin#video_edit', as: 'admin_video_edit'
  patch '/admin/videos/:id/update' => 'admin#video_update', as: 'admin_video_update'
end
