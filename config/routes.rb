Rails.application.routes.draw do

  root to: "public/homes#top"
  get 'about' => 'public/homes#about'

  get 'customers/my_page' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/hide' => 'public/customers#hide'


  scope module: :public do

    resources :items, only:[:index, :show]

    resources :cart_items, only:[:index, :update, :destroy, :create,] do
      collection do
        delete  'destroy_all'
      end
    end

    resources :orders, only:[:new, :create, :index, :show] do
      collection do
        get 'complete'
      end
    end
    post 'orders/confirm'

    resources :addresses, only:[:index, :edit, :create, :update, :destroy]

  end

  namespace :admin do

    get '/' => 'homes#top'

    resources :items, only:[:index, :new, :create, :show, :edit, :update]

    resources :genres, only:[:index, :create, :edit, :update]

    resources :customers, only:[:index, :show, :edit, :update]

    resources :orders, only:[:show, :update] do
      # patch 'order_details/:id' => 'order_details#update', as: 'order_detail'
      resources :order_details, only:[:update]
    end

  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
