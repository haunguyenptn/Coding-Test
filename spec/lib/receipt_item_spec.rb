# frozen_string_literal: true

require_relative '../spec_helper'
require 'receipt_item'
require 'order_item'
require 'product'

describe ReceiptItem do
  let(:product) { Product.new('perfume', 10) }
  let(:order_item) { OrderItem.new(2, product) }
  let(:receipt_item) { ReceiptItem.new(order_item, 1) }

  describe '#name' do
    it { expect(receipt_item.name).to eq('perfume') }
  end

  describe '#quantity' do
    it { expect(receipt_item.quantity).to eq(2) }
  end

  describe '#unit_price' do
    it { expect(receipt_item.unit_price).to eq(10) }
  end

  describe '#price' do
    it { expect(receipt_item.price).to eq(20) }
  end

  describe '#tax' do
    it { expect(receipt_item.tax).to eq(2) }
  end

  describe '#taxed_price' do
    it { expect(receipt_item.taxed_price).to eq(22) }
  end
end
