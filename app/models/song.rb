class Song < ActiveRecord::Base
    has_many :playlists
    has_many :users, through: :playlists

    validates :title, :artist, :genre, presence: true
end  