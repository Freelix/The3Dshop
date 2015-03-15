class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  validate :item_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  private

  def item_present
    if item.nil?
      errors.add(:item, "is not valid")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
  end
end
