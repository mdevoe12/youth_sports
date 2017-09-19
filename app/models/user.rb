class User < ApplicationRecord
  has_secure_password

  self.inheritance_column = :type

  def self.find_or_create_from_twitter_auth(twitter_auth)
    where( provider: twitter_auth[:provider], uid: twitter_auth[:uid])
    .first_or_create do |new_player|
      new_player.type               = "Player"
      new_player.uid                = twitter_auth.uid
      new_player.provider           = twitter_auth.provider
      new_player.oauth_token        = twitter_auth.credentials.token
      new_player.secret             = twitter_auth.credentials.secret
      new_player.password_digest    = "123"
    end
  end

  def self.types
    %w(Coach Player Recruiter Admin)
  end
end
