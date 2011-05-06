class SessionsController < ApplicationController
  def destroy
    self.clear_user
    redirect_to root_path
  end

  def enter
    self.current_user = User.find params[:id]
    flash[:notice] = "Te has colado como #{current_user.name}"
    redirect_to stored_or(root_path)
  end

end
