class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.references :borrowing, index: true

      t.timestamps
    end
  end
end
