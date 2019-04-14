require './lib/common'

describe Common do 
    describe "countDuplicate" do
        it 'returns "{1=>2, 3=>1}" when passed [001,003,001]' do 
            result = Common.countDuplicate(["001","003","001"])
            expect(result).to include('001' => 2, '003' => 1)  
        end 
        it 'returns "{1=>1,2=>1,3=>1}" when passed [001,003,002]' do 
            result = Common.countDuplicate(["001","003","002"])
            expect(result).to include('001' => 1, '003' => 1, '002' => 1)  
        end
        it 'returns "{1=>2,2=>1,3=>1}" when passed [001,003,002,001]' do 
            result = Common.countDuplicate(["001","003","002","001"])
            expect(result).to include('001' => 2, '003' => 1, '002' => 1)  
        end 
    end   

    describe "sale_off" do
        it 'returns "81" when passed 2 Personalised cufflinks' do 
            result = Common.sale_off(90)
            expect(result).to eql(81)  
        end        
    end   

    describe "price_drop" do
        it 'returns "8.5" when passed 2 Lavender heart ' do 
            result = Common.price_drop(Constants::ITEM_NAME, 2, 9.25)
            expect(result).to eql(8.5)  
        end        
    end 
end