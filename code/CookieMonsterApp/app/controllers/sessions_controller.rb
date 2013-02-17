class SessionsController < ApplicationController

  def new
  end

  def destroy
    # session["user_id"] = nil
    reset_session
    redirect_to root_url
  end

  def create
    @user = User.find_by_name(params[:name])
    if @user.nil?
      flash[:notice] = "Who are you?"
    else
      session["user_id"] = @user.id
    end
    redirect_to root_url
  end
end
