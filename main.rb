require_relative './product'
require_relative './basket'
require_relative './warehouse'

products = [
  Product.new(name: "Chocolate", price: 9.99, quantity: 0),
  Product.new(name: "Milk Natural", price: 2.00, quantity: 0),
  Product.new(name: "Still Water", price: 1.68, quantity: 0),
  Product.new(name: "Toilet Paper", price: 8.88, quantity: 0)
]

warehouse = [
  Warehouse.new(product_id: 1, amount: 4),
  Warehouse.new(product_id: 2, amount: 8),
  Warehouse.new(product_id: 3, amount: 11),
  Warehouse.new(product_id: 4, amount: 2)
]

Product.show_products(products)
puts

basket = Basket.new([])

puts "Today on discount: "
Product.discount(products, 1, 2.00)

puts "Your shopping"
puts "======================================================================"

basket.add(products, 1, warehouse, 1)
basket.add(products, 2, warehouse, 1)
basket.remove(products, 1, warehouse, 1)

puts "======================================================================"
puts

basket.sum
basket.sum_with_vat
