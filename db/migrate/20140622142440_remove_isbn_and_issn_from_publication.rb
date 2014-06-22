class RemoveIsbnAndIssnFromPublication < ActiveRecord::Migration
  def change
    remove_column :publications, :isbn
    remove_column :publications, :issn
  end
end
