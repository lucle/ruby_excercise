require 'active_record'
require_relative './models/product'
require './lib/common'
require './lib/checkout'
require './lib/constants'
 
def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
end
ActiveRecord::Base.establish_connection(db_configuration["development"])

puts "List of products: "
products = Product.all
products.each do |row|
    puts row.product_code + ' | ' + row.name + ' | ' + row.price.to_s
end
puts "Please input product code (using commas to separate code): "
selected_codes = gets.chomp

selected_items = Product.where(["product_code IN (:product_code)", {product_code: selected_codes.split(",")}])
hash = Hash.new(0)
hash = Common.countDuplicate(selected_codes.split(","))
hash_item = Hash.new(0) 
data = Object.new
quantity, total = 1, 0
puts "Card details: "
puts 'Code|         Name        |   Price  |   Quantity '
selected_items.each do |item|
    hash.each do |k,v|
        quantity = v if k == item.product_code
    end
    data = Checkout.new(item, quantity)
    total += data.get_price()
    puts item.product_code + ' | ' + item.name + ' | ' + item.price.to_s + ' | ' + quantity.to_s 
end

puts "Basket: #{selected_codes}"
puts "Total price: £#{data.calculate_price(total)}"