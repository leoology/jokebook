class StandUp < ApplicationRecord
    belongs_to :comedian
    validates :bit, presence: true

  
end
