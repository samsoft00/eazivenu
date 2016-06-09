Rails.application.routes.draw do
  
  as :user do
    patch '/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
  end

  devise_for :users, 
    :skip => 'registrations',
    :controllers => {
      confirmations: "confirmations" 
    }

  resources :states, only: [:local_govts] do
    member do
      get 'local_govts'
    end
  end

  resources :venues, path: :venue, path_names: { new: 'add_venue' } do
    member do
      post 'book', to: 'venues#booking', as: 'book_venue'
    end

    collection do
      get 'venue_created', controller: 'pages', as: :venue_created
    end
  end
  scope '/dashboard' do
    get '/',  to: 'dashboard#index', as: :dashboard
    # resources :venues
  end
  get 'search_venue', to: "venues#search"
  root to: 'pages#index', controller: 'pages'

end
