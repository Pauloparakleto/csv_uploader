Rails.application.routes.draw do
  root to: "api/v1/inventories#index"
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :inventories, only: [:index, :create] do
        collection do
          post :extract_csv
          post :update_csv
          get :upload
        end
      end
    end
  end
end
