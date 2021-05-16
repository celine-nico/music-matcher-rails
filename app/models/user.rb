class User < ActiveRecord::Base
    has_secure_password
    has_many :matches
    has_many :kpopgroups, through: :matches 
    
    validates :username, :name, presence: true
    validates :username, uniqueness: true
end