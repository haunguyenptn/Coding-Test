# frozen_string_literal: true

class OrderItem
  attr_reader :quantity, :product

  def initialize(quantity, product)
    @quantity = quantity
    @product = product
  end

  def name
    product.name
  end

  def unit_price
    product.price
  end

  def type
    product.type
  end

  def ==(other)
    quantity == other.quantity && product == other.product
  end
end
