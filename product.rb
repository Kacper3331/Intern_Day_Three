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
    products.each do |x|
      puts "ID: #{x.id} \t|\t NAME: #{x.name} \t|\t PRICE: #{x.price}"
    end
  end

  def self.discount(products, id, amount)
    find_product = products.find{ |x| x.id == id }
    find_product.price -= amount
    puts "======================================================================"
    puts "\tNAME: #{find_product.name} \t|\t SPECIAL PRICE:  #{find_product.price} zl"
    puts "======================================================================"
    puts
  end

  private
  def new_id
    @@id += 1
  end
end
