class AddAuthorToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :author, :string
  end
end
