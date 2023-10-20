Rails.application.routes.draw do

  devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
  }

   scope module: :member do
   root "homes#top"
   post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
   get "/members/top" => "members#top"
   get "/members/unsubscribe" => "members#unsubscribe"
   get "/members/mypage" => "members#show"
   get "/members/information/edit" => "members#edit"
   patch "/members/update" => "members#update"
   patch "/members/withdraw" => "members#withdraw"
   get '/get_category/children', to: 'stores#get_category_children', defaults: { format: 'json' }
   get '/get_category/grandchildren', to: 'stores#get_category_grandchildren', defaults: { format: 'json' }
   get 'searche' => 'stores#search'        #カテゴリ検索
   get 'search_tag' => 'stores#search_tag'     #タグ検索
   get "/stores/like_list" => "stores#like"         #いいねした投稿を表示させる場所
   resources :stores do
    resources :comments, only: [:create, :destroy]
    resource :like_lists, only: [:create, :destroy,]
   end
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

   namespace :admin do
  get "/" => "members#index"
  resources :members, only: [:show, :edit, :update, :destroy]
  resources :categories, only: [:index, :create, :edit, :update]
   get 'searche' => 'stores#search'        #カテゴリ検索
   get 'search_tag' => 'stores#search_tag'     #タグ検索
  resources :stores do
    resources :comments, only: [:destroy]
   end
   end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

