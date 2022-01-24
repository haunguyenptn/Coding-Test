# frozen_string_literal: true

require 'csv'
require 'bigdecimal'
require_relative '../product'
require_relative '../order_item'
require_relative '../order'
require_relative '../unknown_column_error'
require_relative '../missing_value_error'

class CsvOrderReader
  def initialize(path)
    @path = path
  end

  def order
    @order ||= read_order_from_file(@path)
  end

  private

  def read_order_from_file(path)
    items = []
    CSV.foreach(path, **csv_options) do |row|
      allowed_headers.each do |header|
        raise MissingValueError, "Missing value for the field #{header}" if row[header].nil?
      end
      product = Product.new(row[:product], row[:price])
      items << OrderItem.new(row[:quantity], product)
    end
    Order.new(items)
  end

  def allowed_headers
    %i[quantity product price]
  end

  def header_converter
    lambda do |value, field_info|
      header = value.strip.downcase.gsub(' ', '_').to_sym
      raise UnknownColumnError, "Unknown column #{field_info.header}" unless allowed_headers.include?(header)

      header
    end
  end

  def converter
    lambda do |value, field_info|
      case field_info.header
      when :quantity
        Integer(value)
      when :product
        value.strip
      when :price
        BigDecimal(value)
      else
        # We should never reach here if our code is correct
        raise "The CSV converter doesn't know how to handle the field #{field_info.header}"
      end
    end
  end

  def csv_options
    {
      headers: true,
      header_converters: header_converter,
      converters: converter
    }
  end
end
