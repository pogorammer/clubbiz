Rails.application.routes.draw do

  get 'home/index'

  # Search
  get 'search/do_search'
  post 'search/do_search'

  # Reserve Ticket
  get 'reserve_ticket/reserve'
  post 'reserve_ticket/do_reserve'

  # Event Share
  get 'event_share/share'
  post 'event_share/do_share'
  post 'event_share/post_feedback'

  # Student Admin
  get 'student_admin/student_login'
  get 'student_admin/student_edit'
  get 'student_admin/logout'
  post 'student_admin/login'

  # Club Admin
  get 'club_admin/club_edit'
  get 'club_admin/club_post'
  get 'club_admin/club_login'
  post 'club_admin/login'
  get 'club_admin/logout'
  post 'club_admin/post'
  get 'club_admin/event_report'

  # Admin
  get 'admin/validate_club'
  get 'admin/post_announcements'
  post 'admin/do_post'
  get 'admin/accept'
  get 'admin/deny'

  # Club Model
  resources :club, only: [:new, :create, :show, :update]

  # Student Model
  resources :students, only: [:new, :create, :show, :update]

  # Event Model
  resources :event, only: [:new, :create, :show, :update]

  root 'home#index'
  match '/signup',  to: 'students#new',            via: 'get'

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
end
