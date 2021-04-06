class StandUp < ApplicationRecord
    belongs_to :comedian
    validates :bits, presence: true

  
end
