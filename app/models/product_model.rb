class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :sku, :weight, :width, :depth, :height, presence: true
  validates :sku, uniqueness: true, length: {is: 20}
  validates :weight, :width, :depth, :height, numericality: {greater_than: 0}
end
