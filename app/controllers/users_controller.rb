class UsersController < ApplicationController

  def index

  end

  def show
    @users = User.all
    if params[:approved] == "false"
      @users = User.find_by_approved(false)
    else
      @users = User.all
    end
  end

end
