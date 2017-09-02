class User < ApplicationRecord

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :personal_messages, dependent: :destroy
  has_many :authored_conversations, class_name: 'Conversation',
  foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation',
  foreign_key: 'receiver_id'

  self.inheritance_column = :type

  def self.types
    %w(Coach Player Recruiter Admin)
  end

end
