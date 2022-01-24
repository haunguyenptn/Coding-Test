# frozen_string_literal: true

class Receipt
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def total
    @total ||= items.inject(0) { |total, item| total + item.taxed_price }
  end

  def total_tax
    @total_tax ||= items.inject(0) { |total, item| total + item.tax }
  end
end
