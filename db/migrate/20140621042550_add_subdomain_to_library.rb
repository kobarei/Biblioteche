class AddSubdomainToLibrary < ActiveRecord::Migration
  def change
    add_column :libraries, :subdomain, :string
  end
end
