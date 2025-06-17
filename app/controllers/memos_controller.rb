class MemosController < ApplicationController
  before_action :authenticate_child!
  before_action :set_memo, only: [ :edit, :update, :destroy, :delete_image ]

  def index
    @memos = current_child.memos.order(created_at: :desc)
    @memos = @memos.search(params[:query]) if params[:query].present?
    @memos = @memos.by_category(params[:category]) if params[:category].present?

    case params[:sort]
    when "oldest"
      @memos = @memos.oldest
    when "title_asc"
      @memos = @memos.title_asc
    when "title_desc"
      @memos = @memos.title_desc
    else
      @memos = @memos.recent
    end
  end

  def new
    @memo = current_child.memos.build
  end

  def create
    @memo = current_child.memos.build(memo_params)
    if @memo.save
      if params[:return_to_dashboard]
        redirect_to child_dashboard_path, notice: "\u30E1\u30E2\u3092\u4F5C\u6210\u3057\u307E\u3057\u305F"
      else
        redirect_to child_memos_path(current_child), notice: "\u30E1\u30E2\u3092\u4F5C\u6210\u3057\u307E\u3057\u305F"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      if params[:return_to_dashboard]
        redirect_to child_dashboard_path, notice: "\u30E1\u30E2\u3092\u66F4\u65B0\u3057\u307E\u3057\u305F"
      else
        redirect_to child_memos_path(current_child), notice: "\u30E1\u30E2\u3092\u66F4\u65B0\u3057\u307E\u3057\u305F"
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @memo.destroy
    redirect_to child_memos_path(current_child), notice: "\u30E1\u30E2\u3092\u524A\u9664\u3057\u307E\u3057\u305F"
  end

  def delete_image
    image = @memo.images.find(params[:image_id])
    image.purge
    redirect_to edit_child_memo_path(current_child, @memo), notice: "\u753B\u50CF\u3092\u524A\u9664\u3057\u307E\u3057\u305F"
  end

  private

  def set_memo
    @memo = current_child.memos.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:title, :body, :category, images: [])
  end
end
