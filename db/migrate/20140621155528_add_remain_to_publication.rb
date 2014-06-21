class AddRemainToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :remain, :integer
  end
end
