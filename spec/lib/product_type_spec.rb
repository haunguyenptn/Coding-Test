# frozen_string_literal: true

require_relative '../spec_helper'
require 'product_type'

describe ProductType do
  describe '.of' do
    subject { described_class.of(name) }

    context 'book' do
      let(:name) { 'book' }

      it { is_expected.to eq(ProductType::BOOK) }
    end

    context 'food' do
      let(:name) { 'chocolate' }

      it { is_expected.to eq(ProductType::FOOD) }
    end

    context 'medical product' do
      let(:name) { 'pill' }

      it { is_expected.to eq(ProductType::MEDICAL_PRODUCT) }
    end

    context 'other' do
      let(:name) { 'perfume' }

      it { is_expected.to eq(ProductType::OTHER) }
    end
  end
end
