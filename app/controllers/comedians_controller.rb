class ComediansController < ApplicationController
  before_action :find_comedian, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in
  def new
    @comedian=Comedian.new
  end

  def create
    @comedian = Comedian.create(comedian_params)
    if @comedian.id
      session[:id] = @comedian.id
      redirect_to @comedian
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comedian.update(comedian_params(:name, :age, :gender))  
      redirect_to @comedian
    else 
      render :edit
    end 
  end

  def destroy
    @comedian.destroy
    redirect_to comedians_path
  end

  def show
   @jokes= @comedian.jokes.all
  end

  def index
    @comedians= Comedian.all
  end
  private
  def comedian_params(*args)
    params.require(:comedian).permit(*args)
  end 
  def find_comedian 
    @comedian=Comedian.find_by_id(params[:id])
  end 
end
