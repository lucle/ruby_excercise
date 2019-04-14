require './lib/common'

describe Common do 
    describe ".countDuplicate" do
        context 'when passed [001,003,001]' do
            it{ 
                result = Common.countDuplicate(["001","003","001"])
                expect(result).to include('001' => 2, '003' => 1)  
            }
        end 
        context 'when passed [001,003,002]' do 
            it{
                result = Common.countDuplicate(["001","003","002"])
                expect(result).to include('001' => 1, '003' => 1, '002' => 1)  
            }
        end
        context 'when passed [001,003,002,001]' do 
            it{
                result = Common.countDuplicate(["001","003","002","001"])
                expect(result).to include('001' => 2, '003' => 1, '002' => 1)  
            }
        end 
    end   

    describe ".sale_off" do
        context 'when passed 2 Personalised cufflinks' do 
            it{
                result = Common.sale_off(90)
                expect(result).to eql(81)  
            }
        end        
    end   

    describe ".price_drop" do
        context 'when passed 2 Lavender heart ' do 
            it{
                result = Common.price_drop(Constants::ITEM_NAME, 2, 9.25)
                expect(result).to eql(8.5)
            }  
        end        
    end 
end