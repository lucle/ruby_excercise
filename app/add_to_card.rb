require 'active_record'
require_relative './models/product'
require './lib/common'
require './lib/checkout'
 
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

puts "Basket: #{selected_codes}"
selected_items = Product.where(["product_code IN (:product_code)", {product_code: selected_codes.split(",")}])
hash = Hash.new(0)
hash = Common.countDuplicate(selected_codes.split(","))
hash_item = Hash.new(0) 
data = Object.new
quantity, total = 1, 0
selected_items.each do |item|
    hash.each do |k,v|
        if k == item.product_code
            quantity = v
        end
    end
    data = Checkout.new(item, quantity)
    total += data.get_price()
end

puts "Total price: £#{data.calculate_price(total)}"