# config/routes.rb

Rails.application.routes.draw do
  root to: "home#index"

  # Devise認証 for 保護者
  devise_for :parents, path: "parents", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "register"
  }

  # セッション認証 for 子ども
  resource :child_sessions, only: [ :new, :create, :destroy ]

  # 子どものメモ機能＋コメント機能のネスト
  resources :children, only: [] do
    # ここを修正します！ :edit と :update を追加してください
    resources :memos, only: [ :index, :new, :create, :show, :edit, :update, :destroy ] do # <-- 変更点
      resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
    end
  end

  # 単体メモの編集・更新・削除はmemos単体ルートで対応
  # ↑ この行は、上記の修正により不要になる可能性があります。
  #   もし、子どもに紐付かない単独のメモを扱わないのであれば、この行は削除しても良いでしょう。
  #   ただし、今回は `NoMethodError` を解消するため、
  #   一時的にこの行を残しておき、上記の `resources :memos` の変更で解決を試みます。
  resources :memos, only: [ :edit, :update, :destroy ]


  # 保護者と子どもの関係
  resources :parents, only: [ :show ] do
    resources :children, only: [ :new, :create, :show, :destroy ]
  end

  # 保護者ログイン時のダッシュボード
  get "parent_dashboard", to: "parents#dashboard", as: :parent_dashboard

  # 子どもログイン時のダッシュボード
  get "child_dashboard", to: "children#dashboard", as: :child_dashboard

  # 認証済保護者向けのルート設定
  authenticated :parent do
    root to: "parents#dashboard", as: :parent_authenticated_root
  end
end
