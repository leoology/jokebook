class StandUpsController < ApplicationController
  before_action :find_bit, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def new
    @bit=StandUp.new
  end

  def create
    @bit= current_user.stand_ups.build(bit_params(:bit, :comedian_id))
      if @bit.save
        redirect_to comedian_stand_ups_path(current_user)
      else 
        render :new
      end 
  end

  def edit

  end

  def update
    if @bit.update(bit_params(:bit))
      redirect_to comedian_stand_ups_path(current_user.id)
    else 
      render :edit
    end 
  end

  def destroy
    if  @bit.destroy
        redirect_to stand_ups_path
    end 
  end

  def index
    if params[:comedian_id]
      @comedian= Comedian.find(params[:comedian_id])
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
