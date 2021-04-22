class JokesController < ApplicationController
  before_action :find_joke, only: [:show, :edit, :update, :favorite]
  before_action :redirect_if_not_logged_in

  def new
    @joke= Joke.new
    @joke.comedian_jokes.build
  end

  def create
    #byebug
    @joke= current_user.jokes.build(joke_params(:joke, comedian_jokes_attributes: [:rating, :comedian_id, :id]))
    @joke.creator_id=current_user.id
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
   #byebug
    if @joke.creator_id == current_user.id && @joke.update(joke_params(:joke, comedian_jokes_attributes: [:rating, :id]))
        redirect_to comedian_jokes_path(current_user)
    else 
      render :edit
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
     # byebug
    else 
      @jokes=Joke.all
    end 
  end

  def favorite 
    if current_user.jokes.include?(@joke)
      current_user.jokes.delete(@joke)
    else
      comedian_joke=ComedianJoke.create(comedian: current_user, joke:@joke, rating:params[:rating])      
    end
    redirect_to comedian_jokes_path(current_user)
  end
  private
  def joke_params(*args)
    params.require(:joke).permit(*args)
  end 
  def find_joke
    @joke=Joke.find_by_id(params[:id])
  end 
end
