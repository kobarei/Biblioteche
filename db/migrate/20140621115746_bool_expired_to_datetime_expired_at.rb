class BoolExpiredToDatetimeExpiredAt < ActiveRecord::Migration
  def change
    add_column :reservations, :expired_at, :datetime
    add_column :borrowings, :expired_at, :datetime
    remove_column :reservations, :expired
    remove_column :borrowings, :expired
  end
end
