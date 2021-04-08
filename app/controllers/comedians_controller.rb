class ComediansController < ApplicationController
  before_action :find_comedian, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_logged_in, only: [:new]
  before_action :redirect_if_not_logged_in, only: [:show, :edit]
  def new
    @comedian=Comedian.new
  end

  def create
    @comedian = Comedian.create(comedian_params(:name, :email, :gender, :password_digest, :age))
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
    if @comedian.update(comedian_params(:name, :gender))  
      redirect_to @comedian
    else 
      render :edit
    end 
  end

  def show
   # byebug
    @comedian=Comedian.find_by_id(params[:id])

  end

  def index
    @comedians= Comedian.all
  end

  private
    def comedian_params(*args)
      params.require(:comedian).permit(*args)
    end 
    
    def find_comedian 
      @comedian=Comedian.find_by_id(params[:comedian_id])
    end 
end
