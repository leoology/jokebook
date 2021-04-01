class Joke < ApplicationRecord
    has_many :comedians, through: :comedian_jokes
    has_many :comedian_jokes


    
end
