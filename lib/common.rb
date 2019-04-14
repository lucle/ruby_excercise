module Common
    def self.countDuplicate(arr)
        hash = Hash.new(0)
        arr.each do |v|
            hash[v] += 1        
        end
        hash
    end

    def self.sale_off(total_price) 
        if total_price > Constants::SPEND_OVER
            total_price = total_price - (total_price * Constants::PERCENT_OFF)/100
        end
    end

    def self.price_drop(item_name, quantity, price) 
        new_price = 0
        new_price = ((item_name).downcase == (Constants::ITEM_NAME).downcase && quantity >= Constants::ITEM_QUANTITY ) ? Constants::PRICE_DROP : price
    end
end