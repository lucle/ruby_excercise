require './lib/common'

describe 'Common' do it 
    describe "countDuplicate" do
        it 'returns "{1=>2, 3=>1}" when passed [001,003,001]' do 
            result = Common.countDuplicate(["001","003","001"])
            expect(result).to include('001' => 2, '003' => 1)  
        end 
    end   
end