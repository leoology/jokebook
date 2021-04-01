class ApplicationController < ActionController::Base


    private 
    def logged_in?
        !!current_user

    end

    def current_user
       @current_user ||= Comedian.find_by(id: session[:comedian_id]) if session[:comedian_id]

    end

    def redirect_if_not_logged
        redirect_to 
    end
end
