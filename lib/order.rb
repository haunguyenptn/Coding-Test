# frozen_string_literal: true

class Order
  attr_reader :items

  def initialize(order_items)
    @items = order_items
  end

  def ==(other)
    items == other.items
  end
end
