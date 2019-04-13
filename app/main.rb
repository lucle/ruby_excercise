require 'active_record'
require_relative './models/product'
 
def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
end
ActiveRecord::Base.establish_connection(db_configuration["development"])

print "Input the product code: "
product_code = gets.chomp
 
print "Input the product name: "
name = gets.chomp

print "Input the product price: "
price = gets.chomp
 
title = Product.new(product_code: product_code, name: name, price: price)
title.save!

puts "The product created successfully"
puts "Number of products in your database: #{Product.count}" 
puts "Bye!"