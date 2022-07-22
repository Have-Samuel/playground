class Ability
  include CanCan::Ability

    include CanCan::Ability

    def initialize(user)
    user ||= User.new
      # Define abilities for the user here. For example:
      #
      #   return unless user.present?
      #   can :read, :all
      #   return unless user.admin?
      #   can :manage, :all
      if user.is? :admin
        can :manage, :all
      else
        can :manage, Post, user_id: user.id
        can :manage, Comment, user_id: user.id
        can :read, :all
        can :add, Comment
      end
  end
end
