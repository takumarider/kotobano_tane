class CommentsController < ApplicationController
  before_action :authenticate_parent!
  before_action :set_child_and_memo

  def new
    @child = Child.find(params[:child_id])
    @memo = @child.memos.find(params[:memo_id])
    @comment = Comment.new
    @templates = CommentTemplate.all
  end

  def create
    @comment = @memo.comments.build(comment_params)
    @comment.parent = current_parent

    if @comment.save
      redirect_to parent_dashboard_path, notice: "コメントを投稿しました。"
    else
      render :new
    end
  end

  private

  def set_child_and_memo
    @child = Child.find(params[:child_id])
    @memo = @child.memos.find(params[:memo_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
