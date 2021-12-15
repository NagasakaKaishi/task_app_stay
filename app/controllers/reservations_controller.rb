class ReservationsController < ApplicationController
  
  def new
  end
  
  def confirm
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(params[:room])
    @reservation.total_cost = @reservation.number_of_people * @room.cost
    @reservation.room_id = @room.id #room_idを代入
    
    render 'rooms/show' if @reservation.invalid?
  end
  
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(params[:room])
    
    if params[:back]
      render 'rooms/show'
    elsif  @reservation.save
      flash[:success] = "success"
      redirect_to reservation_url(@reservation)
    else
      flash[:success] = "fff"
      render 'rooms/show'
    end
  end
  
  def index
    @reservations = current_user.reservations.all
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :total_cost, :user_id, :room_id)
    end
end
