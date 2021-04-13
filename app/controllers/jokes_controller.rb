class JokesController < ApplicationController
  before_action :find_joke, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def new
    @joke= Joke.new
    @joke.comedian_jokes.build
  end

  def create
    #byebug
    @joke= Joke.new(joke_params(:joke, comedian_jokes_attributes: [:rating, :comedian_id]))
    @joke.comedians << current_user
    #byebug
    if @joke.save
      redirect_to comedian_jokes_path(current_user)
      #byebug
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
    if params[:comedian_id]
      @comedian= Comedian.find(params[:comedian_id])
      @joke= @comedian.jokes
    else 
      @joke=Joke.all
    end 
  end
  private
  def joke_params(*args)
    params.require(:joke).permit(*args)
  end 
  def find_joke
    @joke=Joke.find_by_id(params[:id])
  end 
end
