class ParentsController < ApplicationController
  before_action :authenticate_parent!
  before_action :set_parent, only: [ :show, :edit, :update ]

  def dashboard
    @children = current_parent.children.includes(:memos)
  end

  def show
    @children = @parent.children.includes(:memos)
  end

  def edit
  end

  def update
    if @parent.update(parent_params)
      redirect_to parent_dashboard_path, notice: "\u30D7\u30ED\u30D5\u30A3\u30FC\u30EB\u3092\u66F4\u65B0\u3057\u307E\u3057\u305F\u3002"
    else
      render :edit
    end
  end

  private

  def set_parent
    @parent = current_parent
  end

  def parent_params
    params.require(:parent).permit(:name, :email)
  end
end
