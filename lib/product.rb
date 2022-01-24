# frozen_string_literal: true

require_relative './product_type'

class Product
  attr_reader :name, :price, :type

  def initialize(name, price)
    @name = name.strip
    @price = price.to_f
    @imported = name.include?('imported')
    @type = ProductType.of(name)
  end

  def imported?
    @imported
  end

  def ==(other)
    name == other.name && price == other.price
  end
end
