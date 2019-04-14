require './lib/checkout'
require 'active_record'
require_relative '../app/models/product'
require './lib/constants'

def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
end
ActiveRecord::Base.establish_connection(db_configuration["development"])

describe Checkout do   
    let(:product) {Product.all}
    describe "get_price" do 
        it 'returns "9.25" when passed the first product' do 
            data = Checkout.new(product.first, 1)
            price = data.get_price()
            expect(price.round(2)).to eq(9.25)  
        end 
        it 'returns "17.00" when passed 2 lavender heart' do 
            lavender_item = product.find_by("product_code = ? ", "001")
            data = Checkout.new(lavender_item, 2)
            price = data.get_price()      
            expect(price.round(2)).to eq(17.00)  
        end 
        
    end 
    describe "calculate_price" do
        it 'returns "81.00" when passed 2 Personalised cufflinks' do 
            cuff_item = product.find_by("product_code = ? ", "002")
            data = Checkout.new(cuff_item, 2)
            price = data.get_price()      
            expect(data.calculate_price(price)).to eq(81.00)  
        end
        it 'returns "36.95" when passed 2 Personalised cufflinks' do 
            total = 0
            lavender_item = product.find_by("product_code = ? ", "001")
            lavender_data = Checkout.new(lavender_item, 2)
            lavender_price = lavender_data.get_price()    

            tshirt_item = product.find_by("product_code = ? ", "003")
            tshirt_data = Checkout.new(tshirt_item, 1)
            tshirt_price = tshirt_data.get_price() 

            total = lavender_price + tshirt_price
            expect(lavender_data.calculate_price(total)).to eq(36.95)  
        end

        it 'returns "66.78" when passed 2 Personalised cufflinks' do 
            total = 0
            lavender_item = product.find_by("product_code = ? ", "001")
            lavender_data = Checkout.new(lavender_item, 1)
            lavender_price = lavender_data.get_price()  
            
            cufflinks_item = product.find_by("product_code = ? ", "002")
            cufflinks_data = Checkout.new(cufflinks_item, 1)
            cufflinks_price = cufflinks_data.get_price() 

            tshirt_item = product.find_by("product_code = ? ", "003")
            tshirt_data = Checkout.new(tshirt_item, 1)
            tshirt_price = tshirt_data.get_price() 

            total = lavender_price + cufflinks_price + tshirt_price
            expect(lavender_data.calculate_price(total)).to eq(66.78)  
        end        
    end
      
end