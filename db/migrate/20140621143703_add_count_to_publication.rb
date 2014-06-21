class AddCountToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :count, :integer
  end
end
