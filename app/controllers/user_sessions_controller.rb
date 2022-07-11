class UserSessionsController < ApplicationController
  skip_before_action :require_login
    def new; end
  
    def create
      @user = login(params[:email], params[:password])
      if @user
        redirect_back_or_to posts_path,  notice: "Login successful"
      else
        render :new, notice: 'Login failed'
      end
    end
  
    def destroy
      logout
      redirect_to login_path
    end
  end