class Admin::UsersController < Admin::ResourceController
  resource :user
  expose(:users) { User.all }
  expose(:user)

  def index

  end
end
