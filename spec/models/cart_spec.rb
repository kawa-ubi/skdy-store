require 'rails_helper'

describe Cart do
  describe "listメソッド" do

    it "指定されたcustomerのカート内容を取り出す" do

      customer1 = FactoryGirl.create(:customer)
      customer2 = FactoryGirl.create(:customer)
      books     = FactoryGirl.create_list(:book, 10)
      (0..3).each {|n| FactoryGirl.create(:cart, book: books[n], customer: customer1)}
      (4..6).each {|n| FactoryGirl.create(:cart, book: books[n], customer: customer2)}

      list = Cart.list(customer2.id)
      expect(list.size).to eq(3)
      expect(list[0].book).to eq(books[4])
      expect(list[1].book).to eq(books[5])
      expect(list[2].book).to eq(books[6])
    end
  end

  describe "totalメソッド" do

    it "指定されたカートの合計を戻す" do
      customer1 = FactoryGirl.create(:customer)
      # ２種類の別の本
      books     = FactoryGirl.create_list(:book, 2)
      # それぞれ１冊ずつカートに入れる
      (0..1).each {|n| FactoryGirl.create(:cart, book: books[n], customer: customer1)}

      total = Cart.total(customer1.id)
      expect(total).to eq(1000 * 2)
    end

    it "同じものを5個以上買うと小計を10 % off" do
      customer1 = FactoryGirl.create(:customer)
      # ２種類の別の本
      books     = FactoryGirl.create_list(:book, 2)
      # 本１は１冊ずつ６明細
      (0..5).each {|n| FactoryGirl.create(:cart, book: books[0], customer: customer1)}
      # 本２は５冊を１明細
      FactoryGirl.create(:cart, book: books[1], customer: customer1, quantity: 5)

      sub_total = Cart.sub_total(customer1.id)
      expect(sub_total).to eq(1000 * 6 * 0.9   +   1000 * 5 * 0.9)
    end

    it "1万円以上買うと、合計を 5 % off" do
      customer1 = FactoryGirl.create(:customer)
      # 10種類の別の本
      books     = FactoryGirl.create_list(:book, 10)
      # １冊ずつ10明細
      (0..9).each {|n| FactoryGirl.create(:cart, book: books[n], customer: customer1)}

      total = Cart.total(customer1.id)
      expect(total).to eq(1000 * 10 * 0.95)
    end
  end
end