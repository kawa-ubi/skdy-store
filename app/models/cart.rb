require 'pp'
class Cart < ActiveRecord::Base
  belongs_to :book
  belongs_to :customer

  def self.list(customer_id)
    _carts = Cart.where(customer_id: customer_id).includes(:book).order(:id)
  end

  def self.total(customer_id)
    _carts = Cart.where(customer_id: customer_id).includes(:book)
    pp _carts
    _total = _carts.inject(0) do |sum, cart_item|
      sum + cart_item.book.price
    end
  end
end
