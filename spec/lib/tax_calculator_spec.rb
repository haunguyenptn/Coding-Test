require_relative '../spec_helper'
require 'tax_calculator'

describe TaxCalculator do
  describe '#receipt' do
    let(:product) { Product.new('hperfume', 10) }
    let(:order_item) { OrderItem.new(1, product) }
    let(:order) { Order.new([order_item]) }
    let(:receipt_item) { ReceiptItem.new(order_item, 1) }
    let(:receipt) { Receipt.new([receipt_item]) }
    let(:calc) do
      TaxCalculator.new(
        order,
        [
          SalesTax::BasicSalesTax.new(BigDecimal('0.10')),
          SalesTax::ImportDuty.new(BigDecimal('0.05'))
        ]
      )
    end

    it { expect(calc.receipt).to eq(receipt) }
  end
end
