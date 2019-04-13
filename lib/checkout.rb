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
        result = (total_price > 60 ) ? (total_price - (total_price*10)/100 ).round(2) :  total_price.round(2)
    end

    def hasOver2LavenderItem
        result = false
        result = true  if (@name).downcase == 'lavender heart' && @quantity >= 2
    end

    def price_drop
        price = 0
        price = ((@name).downcase == 'lavender heart' && @quantity >= 2 ) ? 8.50 :  @price
    end
end