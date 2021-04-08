class Joke < ApplicationRecord
    has_many :comedian_jokes
    has_many :comedians, through: :comedian_jokes
    validates :joke, presence: true

    

    
end
