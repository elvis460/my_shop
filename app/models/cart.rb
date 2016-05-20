class Cart
  attr_reader :items #讀取items
  
  def initialize
    @items = []  
  end

  def add_item(product_id)
    item = @items.find{ |t| t.product_id == product_id }
    if item.present?
      item.increment
    else
      @items << CartItem.new(product_id)
    end
  end

  def count
    slef.count
  end

  def quality

  end

  def empty?
    @items.empty?
  end

  def total_price
    # price = 0
    # @items.each do |item|
    #   price += item.total_price
    # end
    # price
    total = items.reduce(0) {|sum,item| sum + item.total_price}
    if xmas?
      total *= 0.9
    end

    total
  end

  private
  def xmas?
    Time.now.month == 12 && Time.now.day == 25
  end
end
