class ComedianJoke < ApplicationRecord
belongs_to :comedian
belongs_to :joke
validates :rating, presence: true, numericality:{less_than: 6, greater_than: 0}



end 