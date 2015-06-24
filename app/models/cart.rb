class Cart < ActiveRecord::Base
  belongs_to :book
  belongs_to :customer

  def self.list(customer_id)
    Cart.where(customer_id: customer_id).includes(:book)
  end

  def self.raw_sub_total(customer_id)
    # integer
    carts = Cart.list customer_id
    data = carts.group('book_id').select('*, sum(quantity) as sum_amount').map do |grp|
      raw_sub_total = grp.sum_amount * grp.book.price
      discount = grp.sum_amount >= 5 ? raw_sub_total / 10 : 0
      {
          book_id: grp.book_id,
          name: grp.book.title,
          sum_amount: grp.sum_amount,
          price: grp.book.price,
          raw_sub_total: raw_sub_total,
          discount: discount,
          discounted: raw_sub_total - discount
      }
    end
    data
  end

  def self.sub_total(customer_id)
    # discounted
    data = Cart.raw_sub_total(customer_id)
    sum = 0
    data.each do |record|
      sum += record[:discounted]
    end
    sum
  end

  def self.raw_total(customer_id)
    result = 0
    Cart.raw_sub_total(customer_id).each do |item|
      result += item[:discounted]
    end
    result
  end

  def self.discount_total(raw_total)
    # integer
    raw_total >= 10000 ? raw_total / 100 * 5 : 0
  end

  def self.total(customer_id)
    # discounted
    raw_total = Cart.raw_total(customer_id)
    discount = Cart.discount_total raw_total
    raw_total - discount
  end
end
