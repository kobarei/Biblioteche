class ReturnPublicationsController < ApplicationController

  # POST /return
  def create
    return_publication
  end

  def return_publication
    @borrowing           = Borrowing.find params[:borrowing_id]
    @borrowing.publication.increment_stock_quantity_by_1
    @return              = Return.create(borrowing_id: @borrowing.id)
    @borrowing.return_id = @return.id

    respond_to do |format|
      if @borrowing.save
        format.html { redirect_to user_path current_user, notice: 'Return was successfully created.' }
      end
    end
  end
end
