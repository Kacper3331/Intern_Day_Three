class Product
  attr_reader :name, :id
  attr_writer :quantity
  attr_accessor :price

  @@id = 0

  def initialize(name:, price:, quantity:)
    @id = new_id
    @name = name
    @price = price
    @quantity = quantity
  end

  def self.show_products(products)
    puts "List of products: "
    puts "======================================================================"
    products.each do |product|
      puts "ID: #{product.id} \t|\t NAME: #{product.name} \t|\t PRICE: #{product.price}"
    end
  end

  def show_discount_product(amount)
    discount(@price, amount)
    puts "======================================================================"
    puts "\tNAME: #{@name} \t|\t SPECIAL PRICE:  #{@price} zl"
    puts "======================================================================"
    puts
  end

  def discount(price, amount)
    price -= amount
  end

  def price_with_vat
    price * 1.23
  end

  private
  def new_id
    @@id += 1
  end
end
