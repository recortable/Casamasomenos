class UsersController < ApplicationController
  respond_to :html
  expose(:users) { User.all }
  expose(:user)

  def index
  end

  def show
  end

  def edit

  end

  def new
  end

  def create
    flash[:notice] = t('users.notice.create') if user.save
    respond_with user
  end

  def update
    authorize! :update, user
    flash[:notice] = "Tus datos han sido guardados." if user.update_attributes(params[:user])
    respond_with user
  end
end
