class Admin::UsersController < Admin::ZapController
  resource :user
  expose(:users) { User.all }
  expose(:user)

  def index

  end
end
