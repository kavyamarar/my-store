class Order < ApplicationRecord
  validates :date, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :item #one to one 

  def total_price
    quantity * item.rate
  end
end
