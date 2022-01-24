# frozen_string_literal: true

class ProductType
  BOOK = 'Book'
  FOOD = 'Food'
  MEDICAL_PRODUCT = 'Medical Product'
  OTHER = 'Other'

  BOOK_KEYWORDS = %w[book].freeze
  FOOD_KEYWORDS = %w[chocolate].freeze
  MEDICAL_PRODUCT_KEYWORDS = %w[pill].freeze

  def self.of(product_name)
    match_product = ->(keyword) { product_name.include?(keyword) }
    if BOOK_KEYWORDS.any?(&match_product)
      BOOK
    elsif FOOD_KEYWORDS.any?(&match_product)
      FOOD
    elsif MEDICAL_PRODUCT_KEYWORDS.any?(&match_product)
      MEDICAL_PRODUCT
    else
      OTHER
    end
  end
end
