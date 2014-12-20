class SubscribedUsersController < ApplicationController

  def new
    @subscribed_user = SubscribedUser.new
  end

  def create
    @subscribed_user = SubscribedUser.new(user_params)
    if @subscribed_user.save
      flash[:notice] = "Email was saved!"
      redirect_to :root
    else
      flash[:error] = "Something went wrong!  Try again!"
      render :new
    end
  end

  private

  def user_params
    params.require(:subscribed_user).permit(:email)
  end

  
end