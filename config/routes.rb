Rails.application.routes.draw do
  #shelters resources hand rolled

  get '/shelters', to: 'shelters#index'
end
