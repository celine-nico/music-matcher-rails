class Kpopgroup < ApplicationRecord
    has_many :matches
    has_many :users, through: :matches

    validates :name, uniqueness: true

    scope :match_with_genre, ->(g){ where(genre: g) }

    def self.search(search)
        if search
            group = Kpopgroup.find_by(name: search)
            # if group
            #     self.where(kpopgroup_id: group)
            # else 
            #     @kpopgroups = Kpopgroup.all
            # end 
        else 
            @kpopgroups = Kpopgroup.all
        end 
    end
end
