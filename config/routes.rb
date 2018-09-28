Rails.application.routes.draw do

  # get 'catcher/sign_in'

  # get 'catcher/sign_up'

  # get 'official/sign_in'

  root 'home#index'
  get "/guidelines" => "home#guidelines", as: "guidelines"
  get "/location_search" => "home#location_search", as: "location_search"

  get "/sign_in" => 'users#sign_in_get', as: "sign_in_get_user"
  get "/sign_up" => 'users#sign_up_get', as: "sign_up_get_user"
  post "/sign_up" => "users#sign_up", as: "sign_up_user"
  post "/sign_in" => "users#sign_in", as: "sign_in_user"
  get "/dashboard" => "user_dashboard#index", as: "user_dashboard"
  get "/logout" => "users#logout", as: "logout_user"
  get "/new_complaint" => "user_dashboard#new_complaint", as: "new_complaint"
  post "/create_complaint" => "user_dashboard#create_complaint", as: "create_complaint"
  get "/edit_complaint" => "user_dashboard#edit_complaint"
  post "/update_complaint" => "user_dashboard#update_complaint"
  get "/view_complaint" => "user_dashboard#view_complaint"
  post "/delete_complaint" => "user_dashboard#delete_complaint"
  post "/complaint_resolved" => "user_dashboard#complaint_resolved"

  get "/officials/sign_up" => "officials#sign_up", as: "sign_up_official"
  get "/officials/sign_in" => "officials#sign_in_get", as: "sign_in_get_official"
  post "/officials/sign_in" => "officials#sign_in", as: "sign_in_official"
  get "official/dashboard" => "official_dashboard#index", as: "official_dashboard"
  get "/officials/logout" => "officials#logout", as: "logout_official"
  get "official/view_complaint" => "official_dashboard#view_complaint"
  post "official/mark_complaint_as_completed" => "official_dashboard#mark_complaint_as_completed"
  get "official/view_all_catchers" => "official_dashboard#view_all_catchers", as: "view_all_catchers"
  get "official/create_contract" => "official_dashboard#create_contract_get"
  post "official/official/create_contract" => "official_dashboard#create_contract"
  get "official/view_all" => "official_dashboard#view_all"
  post "official/add_complaint" => "official_dashboard#add_complaint"
  get "official/view_contract" => "official_dashboard#view_contract"
  post "official/mark_contract_as_completed" => "official_dashboard#mark_contract_as_completed"

  get "/catchers/sign_up" => "catchers#sign_up_get", as: "sign_up_get_catcher"
  get "/catchers/sign_in" => "catchers#sign_in_get", as: "sign_in_get_catcher"
  post "/catchers/sign_up" => "catchers#sign_up", as: "sign_up_catcher"
  post "/catchers/sign_in" => "catchers#sign_in", as: "sign_in_catcher"
  get "catcher/dashboard" => "catcher_dashboard#index", as: "catcher_dashboard"
  get "/catchers/logout" => "catchers#logout", as: "logout_catcher"

  
  # get 'user/sign_up'

  # get 'user/sign_in'

  # get 'home/index'

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
