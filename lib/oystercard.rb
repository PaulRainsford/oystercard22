class Oystercard
    
    DEFAULT_BALANCE = 0
    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1
    MINIMUM_CHARGE = 5
    
    attr_reader :balance, :entry_station, :exit_station, :journeys, :current_journey
                

    def initialize(balance = DEFAULT_BALANCE)
        @balance = balance
        @journeys = []
        @current_journey
    end

    def top_up(amount)
        fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def in_journey?
        @entry_station != nil
    end

    def touch_in(entry_station)
        fail "Insufficient balance to touch in" if (@balance) < MINIMUM_CHARGE
        @entry_station = entry_station
        @exit_station = nil
    end
    
    def touch_out(exit_station)
        deduct MINIMUM_CHARGE
        @exit_station = exit_station
        log_journey
        @entry_station = nil
    end

    def log_journey
        @current_journey = { entry_station: @entry_station, exit_station: @exit_station }
    end
    
   private

    def deduct(amount)
        @balance -= amount
    end

    

end