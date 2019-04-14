class Checkout 

    total_price = 0
    def initialize(product, quantity)
      @product_code = product.product_code
      @name = product.name
      @price = product.price
      @quantity = quantity
    end

    def get_price
        @price = Common.price_drop(@name, @quantity, @price)
        total_price = @price * @quantity
    end

    def calculate_price(total_price)
        result = 0
        result = (total_price > Constants::SPEND_OVER ) ? (total_price - (total_price * Constants::PERCENT_OFF)/100 ).round(2) :  total_price.round(2)
    end
end