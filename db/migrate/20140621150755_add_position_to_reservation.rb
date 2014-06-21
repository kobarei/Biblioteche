class AddPositionToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :position, :integer
  end
end
