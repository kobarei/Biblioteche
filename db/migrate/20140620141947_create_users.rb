class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :library, index: true
      t.string :login_id
      t.integer :age

      t.timestamps
    end
  end
end
