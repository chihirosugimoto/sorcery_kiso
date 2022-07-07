class UserSessionsController < ApplicationController
    def new
    end

    def create
        @user = login(params[:email], params[:password])
        if @user
            redirect_back_or_to posts_path, notice: 'ログインに成功しました'
        else
            render :new
            flash[:notice] = 'ログインに失敗しました'
        end
    end

    def destroy
        logout
        redirect_to root_path, notice: 'ログアウトしました'
    end
end
