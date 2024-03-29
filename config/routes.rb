MikhailZarovny::Application.routes.draw do
  get '/admin', :to => 'admin/images#index', :as => :admin

  namespace :admin do
    resources :images
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'images#index'
  get ':subject_matter/:year/:discipline' => 'images#index',
    :as => :images_all,
    :subject_matter => /#{SUBJECT_MATTER.map(&:to_url).join('|')}/,
    :year => /#{YEAR.map(&:to_url).join('|')}/,
    :discipline => /#{DISCIPLINE.map(&:to_url).join('|')}/

  get ':subject_matter/:year' => 'images#index',
    :as => :images_smy,
    :subject_matter => /#{SUBJECT_MATTER.map(&:to_url).join('|')}/,
    :year => /#{YEAR.map(&:to_url).join('|')}/

  get ':subject_matter' => 'images#index',
    :as => :images_sm,
    :subject_matter => /#{SUBJECT_MATTER.map(&:to_url).join('|')}/

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
