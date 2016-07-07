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

  def self.show_discount_product(products, id, amount)
    product = find_product(products, id)
    puts "======================================================================"
    puts "\tNAME: #{product.name} \t|\t SPECIAL PRICE:  #{discount(product, id, amount)} zl"
    puts "======================================================================"
    puts
  end

  def discount(product, id, amount)
    product.price -= amount
  end

  def find_product(products, id)
    products.find{ |product| product.id == id }
  end

  def price_with_vat
    price * 1.23
  end

  private
  def new_id
    @@id += 1
  end
end
