Rails.application.routes.draw do
  #shelters resources hand rolled

  get '/shelters', to: 'shelters#index'
  get '/shelters/:id', to: 'shelters#show'
end
