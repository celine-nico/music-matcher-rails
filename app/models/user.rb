class User < ActiveRecord::Base
    has_secure_password
    has_many :playlists
    has_many :songs, through: :playlists
    
    validates :username, :name, presence: true
    validates :username, uniqueness: true
end