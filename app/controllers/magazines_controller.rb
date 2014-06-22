class MagazinesController < ApplicationController
  before_action :set_magazine, only: :show

  # GET /magazines/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end
end
