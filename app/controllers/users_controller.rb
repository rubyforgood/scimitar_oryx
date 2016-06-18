class UsersController < ApplicationController

  def index
    if params[:approved] == "false"
      @users = User.find_by_approved(false)
    else
      @users = User.all
    end
  end

  def show
  end

end
