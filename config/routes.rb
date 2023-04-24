Rails.application.routes.draw do
  # ルートページ
  root to: 'public/homes#top'

  # admin用Devise用ルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # public用Devise用ルーティング
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # admin用ログイン後遷移ページ
  get '/admin' => 'admin/homes#top', as: 'admin_top'


  # admin用ルーティング
  namespace :admin do
    resources :users, only: [:show, :edit, :update]
  end
  
  # public用ルーティング
  scope module: :public do
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'

    # patch 'todos/:id/check' => 'todos#check', as: 'check'  # public/todos/show.html.erbのチェックボックス更新用に作ったけどダメだった
    
    # public用各種resources
    resources :users, only: [:show, :edit, :update]
    resources :todos
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
