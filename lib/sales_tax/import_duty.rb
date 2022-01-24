# frozen_string_literal: true

require_relative 'base'

module SalesTax
  class ImportDuty < Base
    def exempt?(product)
      !product.name.include?('imported')
    end
  end
end
