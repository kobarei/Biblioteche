class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :publication, index: true
      t.datetime :expire_at
      t.boolean :expired

      t.timestamps
    end
  end
end
