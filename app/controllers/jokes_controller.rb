class JokesController < ApplicationController
  before_action :find_joke, only: [:show, :edit, :update, :destroy, :favorite]
  before_action :redirect_if_not_logged_in

  def new
    @joke= Joke.new
    @joke.comedian_jokes.build
  end

  def create
    #byebug
    @joke= current_user.jokes.build(joke_params(:joke, comedian_jokes_attributes: [:rating, :comedian_id]))
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
    if @joke.comedian_id == current_user.id && @joke.update(joke_params(:joke))
        redirect_to comedian_jokes_path(current_user)
      end
  end

  def destroy
    @joke.destroy
  end

  def show

  end

  def index
    if params["search"]
      @jokes=Joke.search_by_joke(params["search"])
    elsif params[:comedian_id]
      @comedian= Comedian.find(params[:comedian_id])
      @jokes= @comedian.jokes
    else 
      @jokes=Joke.all
    end 
  end

  def favorite 
    byebug
    if !current_user.id == @joke.comedian.id
      current_user.jokes<< @joke
      redirect_to comedian_jokes_path(current_user)
    else
      @joke.delete
      redirect_to comedian_jokes_path(current_user)

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
