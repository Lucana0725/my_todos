Rails.application.routes.draw do
  root to: 'public/homes#top'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  get 'users/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  patch 'users/withdrawal' => 'public/users#withdrawal', as: 'withdrawal'

  scope module: :public do
    resources :users, only: [:show, :edit]
    resources :todos
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
