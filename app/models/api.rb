require 'net/http'
require 'byebug'
require 'json'

class Api
    attr_reader :url

    def initialize(url)
        @url= url
    end

    def get_page
        #make url into uri
        uri= URI(url)
        #fire the request
        response= Net::HTTP.get_response(uri)
        
        #return response (json)
        JSON(response.body)

    end

    def translate
        #use response to create jokes
        #info is inside jokes
        get_page["jokes"].each do |j|
            Joke.find_or_create_by(joke: j["joke"], category: j["category"])
           
        end 

    end


end 
