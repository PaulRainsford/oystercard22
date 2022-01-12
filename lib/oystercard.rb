class Oystercard

    MAXIMUM_BALANCE = 90
    
    attr_reader :balance, :in_journey
                

    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(amount)
        fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
      @balance += amount
    end

    #def in_journey?
       #! @entry_station.nil?
    #end

    def touch_in
        @in_journey = true
    end

   private

    def deduct(amount)
        @balance -= amount
    end

    

end