
class CashRegister

    attr_accessor :total, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += (quantity*price)
        self.last_transaction = (price*quantity)
        x = 0
        while x < quantity do
            @items << title
            x += 1
        end
    end

    def apply_discount
        if discount == 0 
            "There is no discount to apply."
        else
            self.total = (total * ((100 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total = (self.total - self.last_transaction).to_f
    end
end
