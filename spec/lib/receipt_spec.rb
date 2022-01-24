# frozen_string_literal: true

require_relative '../spec_helper'
require 'receipt'
require 'receipt_item'
require 'order_item'
require 'product'

describe Receipt do
  let(:product) { Product.new('perfume', 10) }
  let(:order_item1) { OrderItem.new(1, product) }
  let(:order_item2) { OrderItem.new(2, product) }
  let(:receipt_item1) { ReceiptItem.new(order_item1, 10) }
  let(:receipt_item2) { ReceiptItem.new(order_item2, 5) }
  let(:receipt) { Receipt.new([receipt_item1, receipt_item2]) }

  describe '#total' do
    it { expect(receipt.total).to eq(50) }
  end

  describe '#total_tax' do
    it { expect(receipt.total_tax).to eq(20) }
  end
end
