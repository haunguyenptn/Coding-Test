# frozen_string_literal: true

require 'bigdecimal'

module SalesTax
  class Base
    attr_reader :rate

    # A rate of 5% is stored as 0.05
    def initialize(rate)
      @rate = BigDecimal(rate)
    end

    def exempt?(_product)
      raise 'Not implemented'
    end
  end
end
