class User < ApplicationRecord

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :authored_conversations, class_name: 'Conversation',
  foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation',
  foreign_key: 'receiver_id'

  self.inheritance_column = :type

  def self.types
    %w(Coach Player Recruiter Admin)
  end

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’])
    user.email = "#{auth[‘uid’]}@#{auth[‘provider’]}.com"
    user.password = auth[‘uid’]
    user.name = auth[‘info’][‘name’]
    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end
end
