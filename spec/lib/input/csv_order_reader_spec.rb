# frozen_string_literal: true

require_relative '../../spec_helper'
require 'input/csv_order_reader'
require 'unknown_column_error'
require 'missing_value_error'

describe CsvOrderReader do
  describe '#read' do
    let(:product1) { Product.new('perfume', 15) }
    let(:item1) { OrderItem.new(1, product1) }
    let(:product2) { Product.new('imported box of chocolate', 10) }
    let(:item2) { OrderItem.new(2, product2) }
    let(:order) { Order.new([item1, item2]) }
    subject { described_class.new(path).order }

    context 'valid input' do
      let(:path) { File.join(__dir__, '../../fixtures/input.csv') }

      it { is_expected.to eq(order) }
    end

    context 'with unknown header' do
      let(:path) { File.join(__dir__, '../../fixtures/input_with_unknown_header.csv') }

      it { expect { subject }.to raise_error(UnknownColumnError) }
    end

    context 'without header' do
      let(:path) { File.join(__dir__, '../../fixtures/input_without_header.csv') }

      # There is no way to confidently determine if a line is a header or data
      it { expect { subject }.to raise_error(UnknownColumnError) }
    end

    context 'with invalid number' do
      let(:path) { File.join(__dir__, '../../fixtures/input_with_invalid_number.csv') }

      it { expect { subject }.to raise_error(ArgumentError) }
    end

    context 'with missing column' do
      let(:path) { File.join(__dir__, '../../fixtures/input_with_missing_column.csv') }

      it { expect { subject }.to raise_error(MissingValueError) }
    end

    context 'with incomplete row' do
      let(:path) { File.join(__dir__, '../../fixtures/input_with_incomplete_row.csv') }

      it { expect { subject }.to raise_error(MissingValueError) }
    end
  end
end
