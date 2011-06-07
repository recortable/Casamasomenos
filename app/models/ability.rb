class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :manage, :all
    end

    can :read, Article
  end
end
