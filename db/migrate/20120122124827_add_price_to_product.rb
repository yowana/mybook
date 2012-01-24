class AddPriceToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :price, :decimals,
    :precision => 8, :scale => 2, :default => 0
  end
  def self.down
    remove_column :prodycts, :price
  end
end

