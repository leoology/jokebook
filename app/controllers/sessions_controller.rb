class SessionsController < ApplicationController
 before_action :redirect_if_not_logged_in, only: [:home]

    def new 
        if logged_in?
            redirect_to home_path
        else 
            render :new
        end 
    end
    
    def create 
        comedian= Comedian.find_by(email: params[:email])
        #byebug
        if comedian && comedian.authenticate(params[:password])
            session[:comedian_id]= comedian.id
            redirect_to '/home'
        else 
            render :new
            flash[:message]="Comedian not found"
        end 
    end 

    def home

    end
  

    def destroy
        session.delete :comedian_id
        redirect_to "/login"
    end

    def omniauth
        @comedian= Comedian.oauth(auth)
        if @comedian.valid?
            session[:comedian_id] = @comedian.id
            redirect_to @comedian
        else 
            render :new
    end 

    private
    def auth
        request.env['omniauth.auth']

    end 


end
