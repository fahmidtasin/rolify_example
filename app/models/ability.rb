class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.has_role?(:admin)
      can :manage, User # Admins can manage User resources
    else
      cannot :read, User # Non-admins can only read User resources
      # Define other abilities as needed for your application
    end
  end
end
