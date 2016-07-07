require_relative './product'
require_relative './basket'
require_relative './warehouse'


product_1 = Product.new(name: "Chocolate", price: 9.99, quantity: 0)
product_2 = Product.new(name: "Milk Natural", price: 2.00, quantity: 0)
product_3 = Product.new(name: "Still Water", price: 1.68, quantity: 0)
product_4 = Product.new(name: "Toilet Paper", price: 8.88, quantity: 0)

products = [ product_1, product_2, product_3, product_4 ]

warehouses = [
  Warehouse.new(product_id: 1, amount: 4),
  Warehouse.new(product_id: 2, amount: 8),
  Warehouse.new(product_id: 3, amount: 11),
  Warehouse.new(product_id: 4, amount: 2)
]

Product.show_products(products)
puts

puts "Today on discount: "

product_1.show_discount_product(10)

puts "Your shopping"
puts "======================================================================"

basket = Basket.new
basket.add(products, 1, warehouses, 1)
basket.add(products, 2, warehouses, 1)
basket.remove(products, 1, warehouses, 1)

puts "======================================================================"
puts

basket.sum
basket.sum_with_vat
