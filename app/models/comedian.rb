class Comedian < ApplicationRecord
    has_many :jokes, through: :comedian_jokes
    has_many :stand_ups
    has_many :comedian_jokes

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

end
