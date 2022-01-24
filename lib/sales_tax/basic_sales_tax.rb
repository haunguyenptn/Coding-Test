# frozen_string_literal: true

require_relative 'base'

module SalesTax
  class BasicSalesTax < Base
    EXEMPTION_LIST = %w[chocolate book pill].freeze

    def exempt?(product)
      EXEMPTION_LIST.any? { |exemption| product.name.include?(exemption) }
    end
  end
end
