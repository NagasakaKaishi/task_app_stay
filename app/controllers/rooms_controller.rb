class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.all
  end
  
  def show
    @room = current_user.rooms.find(params[:id])
  end
  
  def new
    @room = current_user.rooms.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      # success
      flash[:success] = "success"
      redirect_to room_url(@room)
    else
      render 'new'
    end
  end
  
  private
    def room_params
      params.require(:room).permit(:name, :content, :cost, :address, :picture)
    end 
end
