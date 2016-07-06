class Basket < Product
  attr_reader :basket

  def initialize(basket)
    @basket = []
  end

  def add(products, id, warehouse, quantity)
    find_warehouse_product = warehouse.find { |x| x.product_id == id }
    find_product = products.find{ |x| x.id == id }
    if find_warehouse_product.amount != 0
      @basket << find_product
      find_warehouse_product.amount -= quantity
      puts "Added to basket: #{find_product.name} in amount of #{quantity}"
    else
      puts "You can't buy #{find_product.name}, not enough amount in warehouse"
    end
  end

  def remove(products, id, warehouse, quantity)
    find_warehouse_product = warehouse.find { |x| x.product_id == id }
    find_product = products.find{ |x| x.id == id }
    @basket.delete_if{ |x| x.id == id }
    find_warehouse_product.amount -= quantity
    puts "Removed from basket: #{find_product.name} in amount of #{quantity}"
  end

  def sum
    sum = 0
    sum = @basket.map{ |x| x.price }.reduce(0, :+)
    puts "Sum: #{sum.round(2)} zl"
  end

  def sum_with_vat
    sum = 0
    sum = @basket.map{ |x| x.price }.reduce(0, :+)
    sum_vat = sum * 1.23
    puts "Sum VAT: #{sum_vat}"
  end
end
