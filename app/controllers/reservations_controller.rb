class ReservationsController < ApplicationController
  before_action :set_reservation, only: :destroy
  before_action :set_meta, only: :create

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to user_path current_user, notice: 'Reservation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to user_path current_user, notice: 'Reservation was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def set_meta
      params[:reservation][:user_id] = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :publication_id)
    end
end
