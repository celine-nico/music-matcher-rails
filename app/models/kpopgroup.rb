class Kpopgroup < ApplicationRecord
    has_many :matches
    has_many :users, through: :matches

    validates :name, uniqueness: true

    scope :match_with_genre, ->(g){ where(genre: g) }

    def self.search(search)
        if search
            groups = []
            group = Kpopgroup.find_by(name: search)
            return groups << group
            binding.pry
        else 
            @kpopgroups = Kpopgroup.all
        end 
    end
end
