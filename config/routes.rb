Rails.application.routes.draw do


#nested resources of listings and reservations
resources :listings do
  resources :reservations
end


 #7 restful routes are automatically inserted

get '/damien', to: "listings#profile", as: "damiensss"

root 'welcome#index'

#*** rails g clearance:routes show all these default Clearance routes
resources :passwords, controller: "clearance/passwords", only: [:create, :new]
resource :session, controller: "clearance/sessions", only: [:create]
resources :users, controller: "dashboards", only: :show
resources :users, controller: "clearance/users", only: [:create] do
  resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
end

get "/sign_in" => "clearance/sessions#new", as: "sign_in"
delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
get "/sign_up" => "clearance/users#new", as: "sign_up"
#*** end of default routes of Clearance

get "/auth/:provider/callback" => "sessions#create_from_omniauth"


delete '/delete_image' => "listings#delete_image", as: "james"


end
