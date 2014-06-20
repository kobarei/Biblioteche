class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.references :library, index: true
      t.string :login_id

      t.timestamps
    end
  end
end
