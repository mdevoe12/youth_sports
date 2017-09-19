class User < ApplicationRecord

  devise :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy


  self.inheritance_column = :type

  def email_required?
    false
  end

  def self.create_from_omniauth(params)
    attributes = {
      first_name: params.info.name.split[0],
      last_name: params.info.name.split[-1],
      username: params.info.name.split.join.downcase,
      email: params['info']['email'],
      password: Devise.friendly_token
    }
    create!(attributes)
  end

  def self.create_with_oauth(auth)
    user = User.find_or_create_by!(provider: auth.provider, uid: auth.extra.raw_info.id) do |user|
      user.username           = auth.extra.raw_info.name.split.join.downcase
      user.password           = auth.credentials.token
      user.uid                = auth.extra.raw_info.id
      user.provider           = auth.provider
      user.oauth_token        = auth.credentials.token
      user.first_name         = auth.extra.raw_info.name.split[0]
      user.last_name          = auth.extra.raw_info.name.split[-1]
      user.save
    end
    user
  end

  def self.types
    %w(Coach Player Recruiter Admin)
  end
end
