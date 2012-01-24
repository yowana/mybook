require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products
  def setup
    @cart = Cart.new
    @comedy = products(:comedy_book)
    @christian = products(:christian_book)
  end
  
  def test_add_unique_products
    @cart.add_product @comedy
    @cart.add_products @christian
    assert_equal 2, @cart.items.size
    assert_equal @comedy.price + @christian.price, @cart.total_price
  end
  
  def test_add_duplicate_product
    @cart.add_product @comedy
    @cart.add_product @comedy
    assert_equal 2*@comedy.price, @cart.total_price
    assert_equal 1, @cart.items.size
    assert_equal 2, @cart.items[0].quantity
  end
end

