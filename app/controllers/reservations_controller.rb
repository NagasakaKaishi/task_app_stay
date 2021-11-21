class ReservationsController < ApplicationController
  
  def new
  end
  
  def confirm
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(params[:room])
    @reservation.total_cost = @reservation.number_of_people * @room.cost
    @reservation.room_id = @room.id
    
    render 'rooms/show' if @reservation.invalid?
  end
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
    
    @room = Room.find(params[:room])
    
    if @reservation.save
      flash[:success] = "success"
      render 'reservations/new'
    else
      flash[:success] = "fff"
      render 'rooms/show'
    end
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :total_cost, :user_id)
    end
end
