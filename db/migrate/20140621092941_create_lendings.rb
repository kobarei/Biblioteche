class CreateLendings < ActiveRecord::Migration
  def change
    create_table :lendings do |t|
      t.references :user, index: true
      t.references :publication, index: true
      t.datetime :expire_at
      t.boolean :expired, default: false

      t.timestamps
    end
  end
end
