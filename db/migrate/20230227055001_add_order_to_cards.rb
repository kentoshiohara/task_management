class AddOrderToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :order, :integer
  end
end
