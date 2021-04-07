class JokesController < ApplicationController
  before_action :find_joke, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def new

  end

  def create
    @joke= current_user.jokes.build(joke_params(:joke))
    if @joke.save
      redirect_to joke_path(@joke)
    else 
      render :new
    end 
  end

  def edit
  end

  def update
    @joke.update(joke_params(:joke))
  end

  def destroy
    @joke.destroy
  end

  def show

  end

  def index
    @comedian= Comedian.find(params[:comedian_id])
    if params[:comedian_id]
      @joke= @comedian.jokes
    else 
      @joke=Joke.all
    end 
  end
  private
  def joke_params(*args)
    params.require(:joke).permit(*args)
  end 
  def find_bit
    @joke=Joke.find_by_id(params[:id])
  end 

    def redirect_if_not_logged_in
      redirect_to login_path if !logged_in?
  end

  def logged_in?
      !!session[:comedian_id]
  end

  def current_user
      @current_user ||= Comedian.find_by_id(session[:comedian_id]) if session[:comedian_id]
  end

  def redirect_if_logged_in
      redirect_to jokes_path if logged_in?
  end

end
