class HomeController < ApplicationController
  def index
    # すでにログイン済みなら、自動で各ダッシュボードへリダイレクト
    if parent_signed_in?
      redirect_to parent_dashboard_path
    elsif session[:child_id].present? && Child.exists?(session[:child_id])
      redirect_to child_dashboard_path
    end
    # どちらも未ログインなら home/index.html.erb を表示
  end
end
