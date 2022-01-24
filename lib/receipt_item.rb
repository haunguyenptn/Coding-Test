# frozen_string_literal: true

class ReceiptItem
  attr_reader :order_item, :unit_tax

  def initialize(order_item, unit_tax)
    @order_item = order_item
    @unit_tax = unit_tax
  end

  def name
    order_item.product.name
  end

  def quantity
    order_item.quantity
  end

  def unit_price
    order_item.unit_price
  end

  def taxed_unit_price
    unit_price + unit_tax
  end

  def price
    quantity * unit_price
  end

  def tax
    quantity * unit_tax
  end

  def taxed_price
    price + tax
  end
end
