Rails.application.routes.draw do
  root to: "tasks#index"
  
  resources :tasks, except: [:show] do
    collection do
      get 'previous_month'
      get 'next_month'
    end
  end
  
  resources :tasks, only: [:show, :edit, :update, :destroy]
end