Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :workouts
    resources :equipment
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
