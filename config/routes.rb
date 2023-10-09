Rails.application.routes.draw do

  devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
  }

  namespace :member do
   root "homes#top"
   get "/members/unsubscribe" => "members#unsubscribe"
   get "/members/mypage" => "members#show"
   get "/members/information/edit" => "members#edit"
   patch "/members" => "members#update"
   patch "/members/withdraw" => "members#withdraw"
   resources :stores

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
