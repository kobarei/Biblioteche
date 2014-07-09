class ChangePublicationReferecesColumnOfReservationAndBorrowing < ActiveRecord::Migration
  def change
    remove_column :reservations, :publication_id
    remove_column :borrowings, :publication_id

    change_table :reservations do |t|
      t.references :book, index: true
      t.references :magazine, index: true
    end

    change_table :borrowings do |t|
      t.references :book, index: true
      t.references :magazine, index: true
    end
  end
end
