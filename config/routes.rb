Rails.application.routes.draw do
  root to: "tasks#index"
  
  resources :tasks do
    collection do
      get 'previous_month'
      get 'next_month'
    end

    member do
      get 'edit_blockname'
      patch 'update_blockname'
    end
  end
end