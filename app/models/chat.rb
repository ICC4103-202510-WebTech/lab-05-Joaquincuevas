class Chat < ApplicationRecord
    scope :for_user, ->(user_id) { where("sender_id = ? OR receiver_id = ?", user_id, user_id) }

    # Associations
    has_many :messages
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

    validates :sender_id, presence: true
    validates :receiver_id, presence: true
    validate :sender_different_receiver

    private

    def sender_different_receiver
        if sender_id == receiver_id
            errors.add(:receiver_id, "must be different from sender")
        end
    end
end