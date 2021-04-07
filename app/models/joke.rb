class Joke < ApplicationRecord
    has_many :comedian_joke
    has_many :comedians, through: :comedian_joke
    validates :joke, presence: true

    

    
end
