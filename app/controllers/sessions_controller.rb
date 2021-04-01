class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def new 
        @comedian= Comedian.new
    end

  

    def destroy
        session.clear
        redirect_to "/login"
      end

end
