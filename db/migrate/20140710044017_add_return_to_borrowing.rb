class AddReturnToBorrowing < ActiveRecord::Migration
  def change
    add_reference :borrowings, :return, index: true
  end
end
