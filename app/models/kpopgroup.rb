class Kpopgroup < ApplicationRecord
    has_many :matches
    has_many :users, through: :matches

    validates :name, uniqueness: true

    scope :match_with_genre, ->(g){ where(genre: g) }
end
