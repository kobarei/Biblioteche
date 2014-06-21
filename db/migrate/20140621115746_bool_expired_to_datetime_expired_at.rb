class BoolExpiredToDatetimeExpiredAt < ActiveRecord::Migration
  def change
    add_column :reservations, :expired_at, :datetime
    add_column :rentals, :expired_at, :datetime
    remove_column :reservations, :expired
    remove_column :rentals, :expired
  end
end
