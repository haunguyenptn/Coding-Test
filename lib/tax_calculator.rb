# frozen_string_literal: true

require_relative './receipt'
require_relative './receipt_item'

class TaxCalculator
  def initialize(order, tax_policies)
    @order = order
    @tax_policies = tax_policies
  end

  def receipt
    @receipt ||= produce_receipt
  end

  private

  def produce_receipt
    items = []
    @order.items.each do |item|
      tax_rate = @tax_policies.inject(0) { |rate, policy| rate + (policy.exempt?(item.product) ? 0 : policy.rate) }
      unit_tax = round_tax(item.unit_price * tax_rate)
      items << ReceiptItem.new(item, unit_tax)
    end
    Receipt.new(items)
  end

  def round_tax(value)
    value = value * 100 * 2
    value = value.ceil(-1)
    value / 2 / 100
  end
end
