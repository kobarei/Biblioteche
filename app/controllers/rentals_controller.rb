class RentalsController < ApplicationController
  before_action :set_rental, only: [:update, :destroy]
  before_action :set_meta, only: [:create, :update]

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to user_path current_user, notice: 'Rental was successfully created.' }
      else
        format.html { render publication_path @rental.publication }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to user_path current_user, notice: 'Rental was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def set_meta
      params[:rental][:user_id] = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:user_id, :publication_id)
    end
end
