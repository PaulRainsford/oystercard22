class Oystercard
    
    
    MAXIMUM_BALANCE = 90
    MINIMUM_CHARGE = 1
    
    attr_reader :balance, :entry_station
                

    def initialize
        @balance = 0
        @entry_station = nil
    end

    def top_up(amount)
        fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def touch_in(entry_station)
        @entry_station = entry_station
        fail "Insufficient balance to touch in" if (@balance) < MINIMUM_CHARGE
    end
    
    def touch_out
        @entry_station = nil
        deduct(MINIMUM_CHARGE)
    end

    def in_journey?
        @entry_station != nil
    end
    
   private

    def deduct(amount)
        @balance -= amount
    end

    

end