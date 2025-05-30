Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :create] do
    member do
      delete '', to: 'articles#method_not_allowed'
      put '', to: 'articles#method_not_allowed'
      patch '', to: 'articles#method_not_allowed'
    end
  end
end
