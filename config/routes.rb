Rails.application.routes.draw do
  root to: 'public/homes#top'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  
  scope module: :public do
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'

    resources :users, only: [:show, :edit, :update]
    resources :todos
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
