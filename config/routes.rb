Rails.application.routes.draw do

  devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
  }

   scope module: :member do
   root "homes#top"
   get "/members/unsubscribe" => "members#unsubscribe"
   get "/members/mypage" => "members#show"
   get "/members/information/edit" => "members#edit"
   patch "/members/update" => "members#update"
   patch "/members/withdraw" => "members#withdraw"
   get '/get_category/children', to: 'stores#get_category_children', defaults: { format: 'json' }
   get '/get_category/grandchildren', to: 'stores#get_category_grandchildren', defaults: { format: 'json' }
   get "store_search"
   get "/stores/onsen" => "stores#onsen"            #ここから各カテゴリのrouting
   get "/stores/cafe" => "stores#cafe"              #|
   get "/stores/restaurant" => "stores#restaurant"  #|
   get "/stores/leisure" => "stores#leisure"        #|
   get "/stores/shop" => "stores#shop"              #|
   get "/stores/like_list" => "stores#like"         #ここまで
   resources :stores do
    resources :comments, only: [:create, :destroy]
    resource :like_lists, only: [:create, :destroy,]
    collection do
      get "menu_search"
    end
   end

  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

   namespace :admin do
  get "/" => "members#index"
  resources :members, only: [:show, :edit, :update]
  resources :categories, only: [:index, :create, :edit, :update]
   end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

