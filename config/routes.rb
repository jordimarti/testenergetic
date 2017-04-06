Rails.application.routes.draw do
  get 'proposta_predefinides/select', to: 'proposta_predefinides#select', :as => :select_proposta_predefinida
  get 'proposta_predefinides/add', to: 'proposta_predefinides#add', :as => :add_proposta_predefinida
  resources :proposta_predefinides
  get 'documents/index'

  get 'propostes/exporta_xml', to: 'propostes#exporta_xml', :as => :exporta_xml

  resources :propostes
  resources :consums
  resources :instalacions
  resources :identificacions
  resources :envolupants
  resources :edificis do
    resource :download, only: [:show]
  end
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
