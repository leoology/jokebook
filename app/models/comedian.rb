class Comedian < ApplicationRecord
    has_many :comedian_joke
    has_many :jokes, through: :comedian_joke
    has_many :stand_ups

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

end
