class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path, notice: 'ユーザーの作成に成功しました'

        else
            render :new
            flash[:notice] = 'ユーザーの登録に失敗しました'
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name)
    end
end
