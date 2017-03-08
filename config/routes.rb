Rails.application.routes.draw do
  get 'documents/index'

  get 'propostes/exporta_xml', to: 'propostes#exporta_xml', :as => :exporta_xml
  resources :propostes
  resources :consums
  resources :instalacions
  resources :identificacions
  resources :envolupants
  resources :edificis
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
