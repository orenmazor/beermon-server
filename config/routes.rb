Beermon::Application.routes.draw do

  resources :beers, :only => [:index, :create, :show, :update, :destroy] do
    resources :kegs, :only => [:create]
  end

  resources :taps, :only => [:index, :show, :update] do
    resource :keg, :only => [:update, :show]
  end

  resources :kegs, :only => [] do
    member do
      resources :measurements, :only => [:index, :create]
    end
  end

end
