class ComediansController < ApplicationController
  before_action :find_comedian, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_logged_in, only: [:new]
  before_action :redirect_if_not_logged_in, only: [:show, :edit]
  def new
    @comedian=Comedian.new
  end

  def create
    @comedian = Comedian.create(comedian_params(:name, :email, :gender, :password, :age))
    if @comedian.id
      session[:comedian_id] = @comedian.id
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comedian.update(comedian_params(:name, :gender, :bio, :age))  
      redirect_to @comedian
    else 
      render :edit
    end 
  end

  def show
   # byebug

  end

  def index
    @comedians= Comedian.all
  end

  def age
    @comedian=Comedian.sort_by_age
  end

  private
    def comedian_params(*args)
      params.require(:comedian).permit(*args)
    end 

    def find_comedian 
      @comedian=Comedian.find_by_id(params[:id])
    end 

end
