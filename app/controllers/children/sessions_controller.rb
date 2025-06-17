class Children::SessionsController < ApplicationController
  def new
  end

  def create
    @child = Child.find_by(name: params[:name], birthday: params[:birthday])
    if @child
      session[:child_id] = @child.id
      redirect_to child_dashboard_path, notice: "\u30ED\u30B0\u30A4\u30F3\u3057\u307E\u3057\u305F"
    else
      flash.now[:alert] = "\u540D\u524D\u307E\u305F\u306F\u8A95\u751F\u65E5\u304C\u6B63\u3057\u304F\u3042\u308A\u307E\u305B\u3093"
      render :new
    end
  end

  def destroy
    session[:child_id] = nil
    redirect_to root_path, notice: "\u30ED\u30B0\u30A2\u30A6\u30C8\u3057\u307E\u3057\u305F"
  end
end
