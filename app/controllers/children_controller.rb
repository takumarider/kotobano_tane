class ChildrenController < ApplicationController
  before_action :authenticate_child!
  before_action :set_child, only: [ :show, :edit, :update ]

  def dashboard
    @memos = current_child.memos.order(created_at: :desc)
  end

  def show
    @memos = @child.memos.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to child_dashboard_path, notice: "\u30D7\u30ED\u30D5\u30A3\u30FC\u30EB\u3092\u66F4\u65B0\u3057\u307E\u3057\u305F\u3002"
    else
      render :edit
    end
  end

  private

  def set_child
    @child = current_child
  end

  def child_params
    params.require(:child).permit(:name, :birthday)
  end

  def calculate_age(birthday)
    return nil unless birthday.present?

    birth_date = Date.parse(birthday)
    today = Date.today
    age = today.year - birth_date.year
    age -= 1 if today < birth_date.change(year: today.year)
    age
  end
end
