Rails.application.routes.draw do
  constraints(AdminSubdomain) do
    get    :sign_in,  to: "sessions#sign_in"
    post   :save,     to: "sessions#save"
    delete :sign_out, to: "sessions#sign_out"

    resources :admins, only: [:index, :create, :update, :destroy]
    resources :galleries, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :create, :edit, :update, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
  end

  root "pages#index"

  get :about, to: "pages#about"
  get :contact, to: "pages#contact"
end
