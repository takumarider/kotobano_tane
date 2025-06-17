class ParentsController < ApplicationController
  before_action :authenticate_parent!

  def dashboard
    @children = current_parent.children.includes(:memos)
  end

  def show
    @parent = current_parent
    @children = @parent.children
  end
end
