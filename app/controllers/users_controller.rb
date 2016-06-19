class UsersController < ApplicationController

  def index
    @users = if params[:approved] == "false"
              User.where(approved: false)
            else
              User.all
            end
  end

  def show
  end

  def not_approved
    @user_not_approved = User.find(:id)
  end

end

# This controller was added for the purpose of admin account approval
