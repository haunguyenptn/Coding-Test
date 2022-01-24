# frozen_string_literal: true

class PlainTextOutput
  def initialize(receipt)
    @receipt = receipt
  end

  def output
    @output ||= build_output
  end

  private

  def build_output
    output = String.new
    @receipt.items.each do |item|
      output << "#{item.quantity}, #{item.name}, #{f item.taxed_unit_price}\n"
    end
    output << "\n"
    output << "Sales Taxes: #{f @receipt.total_tax}\n"
    output << "Total: #{f @receipt.total}\n"
    output
  end

  # Helper method to format numbers for printing
  def format_number(value)
    format('%.2f', value)
  end

  alias f format_number
end
