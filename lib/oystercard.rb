class Oystercard
    
    
    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1
    
    attr_reader :balance, :in_journey
                

    def initialize(balance = 0)
        @balance = balance
        @in_journey = false
    end

    def top_up(amount)
        fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def touch_in
        fail "Insufficient balance to touch in" if (@balance) < MINIMUM_BALANCE
        @in_journey = true
    end
    
    def touch_out
        @in_journey = false
    end

   private

    def deduct(amount)
        @balance -= amount
    end

    

end