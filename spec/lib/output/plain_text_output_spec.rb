# frozen_string_literal: true

require_relative '../../spec_helper'
require 'output/plain_text_output'
require 'receipt'
require 'receipt_item'

describe PlainTextOutput do
  describe '#build' do
    let(:receipt_item) { double(ReceiptItem) }
    let(:receipt) { Receipt.new([receipt_item]) }
    let(:expected_output) do
      <<~EXPECTED_OUTPUT
        5, music cd, 12.00

        Sales Taxes: 25.00
        Total: 60.00
      EXPECTED_OUTPUT
    end
    subject { described_class.new(receipt).output }

    before do
      allow(receipt_item).to receive(:quantity).and_return(5)
      allow(receipt_item).to receive(:name).and_return('music cd')
      allow(receipt_item).to receive(:taxed_unit_price).and_return(12)
      allow(receipt).to receive(:total_tax).and_return(25)
      allow(receipt).to receive(:total).and_return(60)
    end

    it { is_expected.to eq(expected_output) }
  end
end
