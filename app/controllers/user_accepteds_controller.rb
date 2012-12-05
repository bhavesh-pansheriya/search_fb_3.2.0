class UserAcceptedsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @accepted_list = current_user.user_accepteds
  end
 
  def create
    if current_user.user_accepteds.create(params[:user_accepted])
      flash.now[:notice] = "Accepted successfully."
    else
      flash.now[:alert] = "Sorry!! Accepted failure."
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @found_accepted = UserAccepted.find(params[:id])
    @accepted_list = current_user.user_accepteds
    if @found_accepted.destroy
      flash.now[:notice] = "Accepted record is deleted successfully."
    else
      flash.now[:alert] = "Sorry!! Accepted record is not deleted."
    end
    respond_to do |format|
      format.js
    end
  end

end
