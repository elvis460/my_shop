require 'rails_helper'

RSpec.describe Cart, :type => :model do
  describe "購物車基本功能" do
   it "可以新增商品到購物車裡，然後購物車裡就有東西了" do
    pp = FactoryGirl.create(:product)
    cart = Cart.new
    cart.add_item(pp.id)
    expect(cart.empty?).to be false

    cart2 = Cart.new
    expect(cart2.empty?).to be true
   end
  it "如果加了相同種類的商品，購買項目CartItem並不會增加，但數量會改變" do
    cart = Cart.new
    p1 = FactoryGirl.create(:product)
    p2 = FactoryGirl.create(:product)
    3.times { cart.add_item(p1.id) }
    5.times { cart.add_item(p2.id) }
    expect(cart.items.count).to be 2
    expect(cart.items.first.quantity).to be 3
    expect(cart.items.last.quantity).to be 5
  end
  it "商品可以放到購物車裡，也可以再拿出來" do
    p1 = FactoryGirl.create(:product , :ruby_book)
    cart = Cart.new
    cart.add_item(p1.id)

    expect(cart.items.first.product_id).to be p1.id
    expect(cart.items.first.product).to be_a Product  
    expect(cart.items.first.product.title).to eq p1.title
  end
   #* 可以計算整個購物車的總消費金額
 end

 describe "購物車進階功能" do
   #* 可以將購物車內容轉換成 Hash
   #* 也可以把 Hash 還原成購物車的內容
 end
end
