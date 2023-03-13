Rails.application.routes.draw do

  namespace :public do
    get 'todos/new'
    get 'todos/index'
    get 'todos/show'
    get 'todos/edit'
  end
  root to: 'public/homes#top'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
