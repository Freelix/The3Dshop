class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal

  # Overrides the field name => order.subtotal calls this function
  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.unit_price) : 0 }.sum
  end

  private

  def set_order_status
  	# Put the value to "In progress"
    self.order_status_id = 1
  end

  def update_subtotal
  	# Use the field internally
    self[:subtotal] = subtotal
  end
end
