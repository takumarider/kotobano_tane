class CommentsController < ApplicationController
  before_action :authenticate_parent!
  before_action :set_memo
  before_action :set_comment, only: [ :edit, :update, :destroy ]

  def new
    @comment = @memo.comments.build
  end

  def create
    @comment = @memo.comments.build(comment_params)
    @comment.parent = current_parent

    if @comment.save
      redirect_to parent_dashboard_path, notice: "\u30B3\u30E1\u30F3\u30C8\u3092\u6295\u7A3F\u3057\u307E\u3057\u305F"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to parent_dashboard_path, notice: "\u30B3\u30E1\u30F3\u30C8\u3092\u66F4\u65B0\u3057\u307E\u3057\u305F"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to parent_dashboard_path, notice: "\u30B3\u30E1\u30F3\u30C8\u3092\u524A\u9664\u3057\u307E\u3057\u305F"
  end

  private

  def set_memo
    @memo = Memo.find(params[:memo_id])
  end

  def set_comment
    @comment = @memo.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
