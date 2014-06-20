class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :library, index: true
      t.string :isbn
      t.string :issn
      t.integer :age_limit
      t.integer :status

      t.timestamps
    end
  end
end
