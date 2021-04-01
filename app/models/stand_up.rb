class StandUp < ApplicationRecord
    belongs_to :comedian

    def comedian_attributes=(attributes)
        if !attributes["name"].blank?
            self.comedian= Comedian.find_or_create_by(attributes)
        end 
    end 
end
