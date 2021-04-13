class Joke < ApplicationRecord
    has_many :comedian_jokes 
    has_many :comedians, through: :comedian_jokes
    validates :joke, presence: true
    #accepts_nested_attributes_for :comedian_jokes

    def comedian_jokes_attributes=(comedian_attributes)
      if comedian_attributes.values.first.none?{ |k,v| v.blank?}
        comedian_attributes["0"][:joke]=self
        comedian_attributes["0"][:rating]=comedian_attributes["0"][:rating].to_i

        self.comedian_jokes << ComedianJoke.find_or_create_by(comedian_attributes["0"])
        
       end         
    
    end

    
end
