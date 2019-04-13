require './lib/checkout'
require 'active_record'
require_relative '../app/models/product'

def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
end
ActiveRecord::Base.establish_connection(db_configuration["development"])

describe 'CheckOut' do it    
    describe "get_price" do
        let(:product) {Product.first}
        it 'returns "9.25" when passed the first product' do 
            data = Checkout.new(product, 1)
            total = data.get_price()
            expect(total).to eq(9.25)  
        end 
    end   
end