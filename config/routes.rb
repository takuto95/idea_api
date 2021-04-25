Rails.application.routes.draw do
  resources :ideas ,only: [:index,:create] do
    collection do
      get 'search'
    end
  end

end
