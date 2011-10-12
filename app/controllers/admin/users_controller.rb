class Admin::UsersController < Admin::ApplicationController
  expose(:users) { User.all }
  expose(:user)

  def index

  end
end
