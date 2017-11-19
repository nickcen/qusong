Rails.application.routes.draw do
  devise_for :couriers

  resources :waybills do 
    member do 
      put :accept
      put :reject
      put :yiqu
    end
  end

  get 'home', to: 'home#index'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
