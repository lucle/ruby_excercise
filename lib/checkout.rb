class Checkout
    total_price = 0
    def initialize(product, quantity)
      @product_code = product.product_code
      @name = product.name
      @price = product.price
      @quantity = quantity
    end

    def get_price
        @price = price_drop
        total_price = @price * @quantity
    end

    def calculate_price(total_price)
        result = 0
        if total_price > 60 
            result = total_price - (total_price*10)/100
        else
            result = total_price    
        end
        result.round(2)
    end

    def hasOver2LavenderItem
        result = false
        if (@name).downcase == 'lavender heart' && @quantity >=2
            result = true
        end
        result
    end

    def price_drop
        price = 0
        if (@name).downcase == 'lavender heart' && @quantity >=2
            price = 8.50
        else 
            price = @price
        end
        price
    end
end