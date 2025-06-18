class ChildSessionsController < ApplicationController
  def create
    # 名前が空かどうかを確認
    if params[:name].blank?
      flash.now[:alert] = "あなたの「なまえ」は？？。"
      render :new and return
    end

    name = params[:name]

    # 生年月日のパース処理
    # birthdayが正しく送られてこない場合に備えてrescueを追加
    begin
      birthday = Date.new(
        params[:birthday]["birthday(1i)"].to_i,
        params[:birthday]["birthday(2i)"].to_i,
        params[:birthday]["birthday(3i)"].to_i
      )
    rescue ArgumentError # 無効な日付が指定された場合
      flash.now[:alert] = "「誕生日🎂」はあっていますか？？"
      render :new and return
    end

    input_age = params[:age].to_i

    child = Child.find_by(name: name, birthday: birthday)
    puts "DEBUG: child found -> #{child.inspect}"

    if child
      if child.age != input_age
        flash.now[:alert] = "「何歳」ですか？？。"
        render :new and return # ここで処理を中断
      end
      session[:child_id] = child.id
      redirect_to child_dashboard_path, notice: "ログインしました。"
    else
      flash.now[:alert] = "ぜんぶ入力できたかな？？"
      render :new # 処理を続行
    end
  end

  def destroy
    session.delete(:child_id)
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
