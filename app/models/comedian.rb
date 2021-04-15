class Comedian < ApplicationRecord
    has_many :comedian_jokes
    has_many :jokes, through: :comedian_jokes
    has_many :stand_ups
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    def self.oauth(auth)
        self.find_or_create_by(uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.name = auth['info']['name'] 
            u.password = SecureRandom.hex(20)
        end 
    end 

end
