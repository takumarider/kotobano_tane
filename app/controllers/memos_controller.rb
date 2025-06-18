# app/controllers/memos_controller.rb

class MemosController < ApplicationController
  before_action :set_memo, only: [ :show, :edit, :update, :destroy ]
  before_action :set_child
  before_action :authenticate_child_or_parent!

  def index
    @categories = Category.all

    # 子どもに紐づくメモを取得
    @memos = @child.memos.order(created_at: :desc)

    # カテゴリでの絞り込み
    if params[:category_id].present?
      @memos = @memos.where(category_id: params[:category_id])
    end
  end

  def show
  end

  def new
    @memo = @child.memos.new
  end

  def create
    @memo = @child.memos.new(memo_params)
    if @memo.save
      # リダイレクト先を child_memo_path に修正
      redirect_to child_memo_path(@child, @memo), notice: "メモを作成しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      # リダイレクト先を child_memo_path に修正
      redirect_to child_memo_path(@child, @memo), notice: "メモを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    # リダイレクト先を child_memos_path に修正
    redirect_to child_memos_path(@child), notice: "メモを削除しました。"
  end

  private

  def set_memo
    # ここも修正が必要な場合がありますが、今回は params[:id] でメモを特定できると仮定します。
    # もし child_id も必要なら @child.memos.find(params[:id]) のように変更します。
    @memo = Memo.find(params[:id])
  end

  def set_child
    if child_signed_in?
      @child = current_child
    elsif parent_signed_in?
      # 保護者が見る場合は URL の child_id から子どもを特定
      @child = Child.find(params[:child_id])
    else
      redirect_to root_path, alert: "不正なアクセスです"
    end
  end

  def memo_params
    params.require(:memo).permit(:title, :body, :category_id, images: [])
  end

  def authenticate_child_or_parent!
    unless child_signed_in? || parent_signed_in?
      redirect_to root_path, alert: "ログインしてください"
    end
  end
end
