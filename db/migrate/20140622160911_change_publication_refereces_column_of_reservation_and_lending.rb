class ChangePublicationReferecesColumnOfReservationAndLending < ActiveRecord::Migration
  def change
    remove_column :reservations, :publication_id
    remove_column :lendings, :publication_id

    change_table :reservations do |t|
      t.references :book, index: true
      t.references :magazine, index: true
    end

    change_table :lendings do |t|
      t.references :book, index: true
      t.references :magazine, index: true
    end
  end
end
