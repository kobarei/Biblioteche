class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.references :library, index: true
      t.integer :age_limit
      t.integer :status
      t.string :author
      t.string :name
      t.integer :count
      t.integer :remain
      t.string :issn
      t.integer :interval

      t.timestamps
    end
  end
end
