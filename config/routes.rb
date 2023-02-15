Rails.application.routes.draw do
  # create  routes name space i.e api/v1/MODEL
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :spots do
        resources :reviews
      end
    end
  end
end
