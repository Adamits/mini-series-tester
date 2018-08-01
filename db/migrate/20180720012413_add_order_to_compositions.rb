class AddOrderToCompositions < ActiveRecord::Migration
  def change
    add_column :compositions, :order, :integer
  end
end
