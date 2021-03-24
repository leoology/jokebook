class Comedian < ApplicationRecord
    has_many :jokes
    has_many :stand_ups
end
