class LendPublicationsController < ApplicationController
  before_action :set_borrowing, only: [:update, :destroy]
  before_action :set_meta, only: [:create, :update]

  # POST /borrowings
  def create
    lend_publication
  end

  # PATCH/PUT /borrowings/1
  def update
    respond_to do |format|
      if @borrowing.update(borrowing_params)
        format.html { redirect_to @borrowing, notice: 'Borrowing was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /borrowings/1
  def destroy
    @borrowing.destroy
    respond_to do |format|
      format.html { redirect_to user_path current_user, notice: 'Borrowing was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowing
      @borrowing = Borrowing.find(params[:id])
    end

    def set_meta
      params[:borrowing][:user_id] = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrowing_params
      params.require(:borrowing).permit(:user_id, :book_id, :magazine_id)
    end

    def lend_publication
      @borrowing = Borrowing.new(borrowing_params)

      respond_to do |format|
        if @borrowing.save
          format.html { redirect_to user_path current_user, notice: 'Borrowing was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

end
