class DropPositionFromReservation < ActiveRecord::Migration
  def change
    remove_column :reservations, :position
  end
end
