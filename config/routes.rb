Rails.application.routes.draw do
  #shelters
  get '/shelters', to: 'shelters#index'
  post '/shelters', to: 'shelters#create'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id', to: 'shelters#show'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  #pets
  get '/pets', to: 'pets#index'

  #shelter_pets
  get '/shelters/:id/pets', to: 'shelter_pets#index'
end
