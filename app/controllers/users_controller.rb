class UsersController < ApplicationController
  respond_to :html
  expose(:users) { User.all }
  expose(:user)

  def index
  end

  def show
  end

  def new
  end

  def create
    flash[:notice] = t('users.notice.create') if user.save
    respond_with user
  end
end
