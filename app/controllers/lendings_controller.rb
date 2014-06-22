class LendingsController < ApplicationController
  before_action :set_lending, only: [:update, :destroy]
  before_action :set_meta, only: [:create, :update]

  # POST /lendings
  def create
    @lending = Lending.new(lending_params)

    respond_to do |format|
      if @lending.save
        format.html { redirect_to user_path current_user, notice: 'Lending was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /lendings/1
  def update
    respond_to do |format|
      if @lending.update(lending_params)
        format.html { redirect_to @lending, notice: 'Lending was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /lendings/1
  def destroy
    @lending.destroy
    respond_to do |format|
      format.html { redirect_to user_path current_user, notice: 'Lending was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lending
      @lending = Lending.find(params[:id])
    end

    def set_meta
      params[:lending][:user_id] = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lending_params
      params.require(:lending).permit(:user_id, :publication_id)
    end
end
