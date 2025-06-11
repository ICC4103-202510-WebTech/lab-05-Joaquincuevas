class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :create, Message
    can [:update, :destroy], Message, user_id: user.id
    can [:edit, :update, :destroy], User, id: user.id
    can [:edit, :update, :destroy], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end
    can :select_as_sender, Chat, sender_id: user.id

    can :create, Chat do |chat|
      chat.receiver_id.present? && chat.receiver_id != user.id
    end

    can :read, User if user.admin?
  end
end