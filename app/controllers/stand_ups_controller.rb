class StandUpsController < ApplicationController
  before_action :find_bit, only: [:show, :edit, :update, :destroy]

  def new
    @bit=StandUp.new
  end

  def create
    if  @bit=StandUp.create(bit_params(:bits, :comedian_id))
      
      redirect_to '/stand_ups'
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
    
    @bit=StandUp.all
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
