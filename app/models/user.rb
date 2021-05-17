class User < ActiveRecord::Base
    has_secure_password
    
    has_many :matches
    has_many :kpopgroups, through: :matches 
    
    validates :username, :name, presence: true
    validates :username, uniqueness: true

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth['info']['name']
            u.username = auth['info']['email']
            # u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end
end