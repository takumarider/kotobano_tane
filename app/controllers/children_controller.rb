class ChildrenController < ApplicationController
  before_action :authenticate_parent!, except: [ :dashboard ]
  before_action :require_child_login, only: [ :dashboard ]
  before_action :set_parent, except: [ :dashboard ]

  def index
    @children = @parent.children
  end

  def new
    @child = @parent.children.new
  end

  def create
    @child = @parent.children.new(child_params)
    if @child.save
      redirect_to parent_path(@parent), notice: "子どもを登録しました"
    else
      render :new
    end
  end

  def destroy
    @child = @parent.children.find(params[:id])
    @child.destroy
    redirect_to parent_path(@parent), notice: "子どもを削除しました"
  end

  def dashboard
    @child = Child.find_by(id: session[:child_id])
    unless @child
      reset_session
      redirect_to new_child_sessions_path, alert: "ログインしてください"
    end
  end

  private

  def set_parent
    @parent = current_parent
  end

  def child_params
    params.require(:child).permit(:name, :birthday, :age)
  end

  def require_child_login
    unless session[:child_id] && Child.exists?(session[:child_id])
      redirect_to new_child_sessions_path, alert: "ログインしてください"
    end
  end
end
