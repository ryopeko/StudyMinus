class User < ActiveRecord::Base
  has_many :activities

  def self.create_with_omniauth(auth)
    create(
      name: auth['info']['nickname'],
      uid: auth['uid'],
      provider: auth['provider']
    )
  end
end
