Rails.application.routes.draw do
  root "pages#index"
  resources :boards
  resource :users, controller: "registrations", only: [:create, :update, :edit] do
    get 'sign_up', action: 'new'
  end

  resource :users, controller: "sessions", only: [] do
    get '/sign_in', action: "new"
    post '/sign_in', action: "create"
    delete '/sign_out', action: "destroy"
  end

end
