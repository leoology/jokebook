class SessionsController < ApplicationController

    def new 
        @comedian= Comedian.new

    end
    
    def destroy
        session.clear
        redirect_to "/login"
      end

end
