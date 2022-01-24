# frozen_string_literal: true

require_relative './order'
require_relative './order_item'
require_relative './product'
require_relative './product_type'
require_relative './receipt'
require_relative './receipt_item'
require_relative './tax_calculator'
require_relative './sales_tax/basic_sales_tax'
require_relative './sales_tax/import_duty'
require_relative './input/csv_order_reader'
require_relative './output/plain_text_output'

module Program
  def self.run(path)
    tax_policies = [
      ::SalesTax::BasicSalesTax.new('0.10'),
      ::SalesTax::ImportDuty.new('0.05')
    ]
    order = CsvOrderReader.new(path).order
    receipt = TaxCalculator.new(order, tax_policies).receipt
    output = PlainTextOutput.new(receipt).output
    puts output
  rescue RuntimeException => e
    puts "Error: #{e.message}"
  end
end
