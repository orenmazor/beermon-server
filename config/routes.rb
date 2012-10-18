Beermon::Application.routes.draw do

  resources :beers, :only => [:index, :create, :show, :update, :destroy] do
    resources :kegs, :only => [:create]
    resources :ratings, :only => [:create, :new]
  end

  resources :taps, :only => [:index, :show, :update] do
    resource :keg, :only => [:update, :show]
  end

  resources :kegs, :only => [] do
    resources :measurements, :only => [:index, :create]
  end

end
