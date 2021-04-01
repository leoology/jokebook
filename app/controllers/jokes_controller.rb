class JokesController < ApplicationController
  before_action :find_joke, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def new
    @joke=Joke.new
  end

  def create
    @joke= Joke.create(joke_params(:joke))
    redirect_to '/jokes'
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
    @joke=Joke.all
  end
  private
  def joke_params(*args)
    params.require(:joke).permit(*args)
  end 
  def find_bit
    @joke=Joke.find_by_id(params[:id])
  end 
end
