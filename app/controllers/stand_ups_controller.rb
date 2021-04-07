class StandUpsController < ApplicationController
  before_action :find_bit, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def new
    @bit=StandUp.new
  end

  def create
    @bit=StandUp.new(bit_params(:bits, :comedian_id))
    if @bit.save
      redirect_to 'comedian_path/:id/stand_ups_path/:id'
    else 
      render :new
    end 
  end

  def edit

  end

  def update
    @bit.update(bit_params(:bits))
  end

  def destroy
    if  @bit.destroy
        redirect_to stand_ups_path
    end 
  end

  def index
    @comedian= Comedian.find(params[:comedian_id])
    if params[:comedian_id]
      @bit= @comedian.stand_ups
    else 
      @bit=StandUp.all
    end 
  end

  def show
  end

  private
  def bit_params(*args)
    params.require(:stand_up).permit(*args)
  end 
  def find_bit
    @bit=StandUp.find_by_id(params[:id])
  end 


end
