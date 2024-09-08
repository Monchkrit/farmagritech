Rails.application.routes.draw do
  resources :listings
  get 'pages/about'
  get 'pages/contact'
  get 'pages/terms'
  get 'pages/privacy'
  get 'pages/fatlsp'
  get 'planttypes/index'
  get 'planttypes/import'
  get 'chorizons/index'
  get 'chorizons/import'
  get 'components/index'
  get 'components/import'
  get 'soil/index'
  get 'soil/import'
  get 'phmuszipcodes/index'
  get 'phmuszipcodes/import'
  get 'farmer' => "listings#farmer"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
  get 'success' => "orders#success"
  get 'cancel' => "orders#cancel"
  get 'charge' => "orders#charge"
  get 'agritechs' => "listings#agritech"
  get 'vegetables' => "listings#vegetables"
  get 'fruits' => 'listings#fruits'
  get 'herbs' => 'listings#herbs'
  get 'flowers' => 'listings#flowers'
  get 'indoor_plants' => 'listings#indoor_plants'
  get 'outdoor_plants' => 'listings#outdoor_plants'
  get 'trees' => 'listings#trees'
  get 'gardentable' => 'gardens#gardentable'
  get 'gardener/gardens/gardentable' => 'gardener/gardens#gardentable'
  get 'growtable' => 'gardens#growtable'
  get 'gardener/gardens/growtable' => 'gardener/gardens#growtable'
  get 'worktable' => 'jobs#worktable'
  get 'gardener/jobs/worktable' => 'gardener/jobs#worktable'
  get 'gardener/jobs' => 'gardener/jobs#index'
  get 'gardener/jobs/new' => 'gardener/jobs#new'
  post 'gardener/jobs/create' => 'gardener/jobs#create'
  get 'gardener/jobs/schedule' => 'gardener/jobs#schedule'
  get 'row_irrigate' => 'rows#irrigate'
  get 'garden_irrigate' => 'gardens#irrigate'
  get 'row_cultivate' => 'rows#cultivate'
  get 'row_feed' => 'rows#feed'
  get 'row_weed' => 'rows#weed'
  get 'row_harvest' => 'rows#harvest'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"

  namespace :gardener do
    resources :gardens, only: [:show, :index]
  end

  resources :gardens, shallow: true do
    resources :prisms
    resources :enrollments, only: :create
    end
  resources :soilcubes, only: [:show, :edit, :update]
  resources :rows

  resources :listings do
    resources :orders
  end

  resources :enrollments, only: [:show, :index]

  resources :jobs

  resources :accounting

  resources :phmuszipcodes do
    collection { post :import }
  end

  resources :soil do
    collection { post :import }
  end

  resource :planttypes do
    collection { post :import }
  end
end
