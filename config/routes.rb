Rails.application.routes.draw do
  #予約
  get 'bookings/new'
  get 'bookings/confirmation' #予約確認
  post "bookings/reservations" #予約確定処理

  #ユーザー
  get "users/index" #登録済みユーザー一覧（確認用）
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get 'sign_up' => "users#new" #ユーザー登録画面
  post 'users/create' #ユーザー登録処理
  get "users/:id/profile" => "users#profile" #プロフィール編集画面
  post 'users/:id/update' => "users#update" #プロフィール更新
  get 'users/:id/account' => "users#account" #アカウント確認画面
  get "users/:id/edit_account" => "users#edit_account" #アカウント編集画面
  post "users/:id/update_account"=> "users#update_account" #アカウント情報更新
  get 'users/owns' => "users#owns" #所有している部屋一覧
  get "users/reservations" => "users#reservations" #予約済みの部屋一覧
  get "users/reservations/:id" => "users#reservations_show" #予約済みの部屋詳細確認

  # 部屋
  get 'rooms/new' => "rooms#new" #部屋を登録する画面
  post 'rooms/create' #登録処理
  get 'rooms/show'=>"rooms#show" #登録後、部屋の詳細ページを表示
  get "rooms/:id" => "rooms#show" #一覧からアクセス
  get "/" => "rooms#top" #トップページ
  get 'search' => "rooms#search"
end
