# frozen_string_literal: true

require_relative '../spec_helper'
require 'product'

describe Product do
  xdescribe '#initialize' do
    context 'strip whitespace from name' do
    end

    context 'convert arguments to expected type' do
    end
  end

  describe '#imported?' do
    subject { described_class.new(name, 10).imported? }

    context 'when not imported' do
      let(:name) { 'book' }

      it { is_expected.to be(false) }
    end

    context 'when imported' do
      let(:name) { 'imported book' }

      it { is_expected.to be(true) }
    end
  end
end
