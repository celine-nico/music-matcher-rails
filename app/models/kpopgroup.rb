class Kpopgroup < ApplicationRecord
    has_many :matches
    has_many :users, through: :matches

    validates :name, uniqueness: true
end
