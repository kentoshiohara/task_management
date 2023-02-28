class RemoveOrderFromCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :order, :integer
  end
end
