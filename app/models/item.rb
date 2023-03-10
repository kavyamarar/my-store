class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :orders, dependent: :destroy #association one to many

  scope :order_by_name, ->{order(name: :asc)}

  def grand_total
    orders.sum(&:total_price)
  end
end
