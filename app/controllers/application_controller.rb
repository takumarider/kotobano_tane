class ApplicationController < ActionController::Base
  helper_method :current_child, :child_signed_in?

  protected

  # 現在ログイン中の子どもユーザーを返す（セッションから）
  def current_child
    @current_child ||= Child.find_by(id: session[:child_id])
  end

  # 子どもユーザーがログインしているかどうか
  def child_signed_in?
    current_child.present?
  end

  # 子ども用認証フィルター（ログインしてなければログインページへリダイレクト）
  def authenticate_child!
    unless child_signed_in?
      redirect_to new_child_sessions_path, alert: "ログインしてください"
    end
  end

  # Deviseのafter_sign_in_path_forを活用しつつParent専用の遷移を設定
  def after_sign_in_path_for(resource)
    if resource.is_a?(Parent)
      parent_dashboard_path
    else
      super
    end
  end

  # サインアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
