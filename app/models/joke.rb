class Joke < ApplicationRecord
    has_many :comedian_jokes 
    has_many :comedians, through: :comedian_jokes
    validates :joke, presence: true
    accepts_nested_attributes_for :comedian_jokes, reject_if: proc { |attributes| attributes.any? {|k,v| v.blank?}}
    scope :search_by_joke, -> (search) {where("joke LIKE ?", "%#{search}%")}

    #def comedian_jokes_attributes=(comedian_attributes)
     # if comedian_attributes.values.first.none?{ |k,v| v.blank?}
       # self.comedian_jokes << ComedianJoke.find_or_create_by(comedian_attributes["0"])
        
        
      # end         
   # end

    def format_favorite_button(comedian_id)
        self.comedian_ids.include?(comedian_id) ? "Unsave" : "Save"

    end

    
end
