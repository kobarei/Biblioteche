class AddStockToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :stock, :integer
  end
end
