# frozen_string_literal: true

require_relative '../spec_helper'
require 'order'
require 'order_item'
require 'product'

describe Order do
  describe '#==' do
    let(:product) { Product.new('cd', 10) }
    let(:order_item1) { OrderItem.new(1, product) }
    let(:order_item2) { OrderItem.new(quantity, product) }
    let(:order1) { Order.new([order_item1]) }
    let(:order2) { Order.new([order_item2]) }
    subject { order1 == order2 }

    context 'when equal' do
      let(:quantity) { 1 }

      it { is_expected.to be(true) }
    end

    context 'when not equal' do
      let(:quantity) { 2 }

      it { is_expected.to be(false) }
    end
  end
end
