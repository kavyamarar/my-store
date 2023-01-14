class Order < ApplicationRecord
  validates :date, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :ensure_item_quantity_greater_than_zero

  belongs_to :item #one to one 

  before_save :set_total
  after_save :update_item_quantity
  after_destroy :update_item_quantity
 

  def total_price
    quantity * item.rate
  end

  private

  def set_total
    self.total = quantity * item.rate
  end

  def update_item_quantity
    changed_quantity = self.quantity_previously_was.to_f - quantity
    updated_quantity =  item.quantity + changed_quantity
    item.update(quantity: updated_quantity)
  end

  def ensure_item_quantity_greater_than_zero
     return true if self.quantity <= item.quantity
     throw(:abort)
  end
   
end
