Rails.application.routes.draw do
    root "items#index"

    resources :items do
        resources :orders
    end
end
