# frozen_string_literal: true

require_relative '../spec_helper'
require 'order_item'
require 'product'

describe OrderItem do
  describe '#unit_price' do
    let(:product) { Product.new('chocolate', 10) }
    subject { described_class.new(2, product).unit_price }

    it { is_expected.to eq(10) }
  end

  describe '#==' do
    let(:product) { Product.new('chocolate', 10) }
    subject { item1 == item2 }

    context 'when equal' do
      let(:item1) { described_class.new(2, product) }
      let(:item2) { described_class.new(2, product) }

      it { is_expected.to be(true) }
    end

    context 'when not equal' do
      let(:item1) { described_class.new(1, product) }
      let(:item2) { described_class.new(2, product) }

      it { is_expected.to be(false) }
    end
  end
end
