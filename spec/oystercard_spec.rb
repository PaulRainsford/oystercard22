require 'oystercard'

describe Oystercard do 
    let(:station) {double :station}
    

    it 'has a balance of 0' do
        expect(subject.balance).to eq(0)
    end
    
    describe '#top_up' do
      it 'can top up the balance' do
        expect{ subject.top_up 20 }.to change{ subject.balance }.by 20
      end

      it 'raises an error if the maximum balance is exceeded' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
      end
    end
    
    describe '#touch_in' do
      it "changes @in_journey? to true when touched in" do
        subject.top_up(5)
        expect { subject.touch_in(station) }.to change { subject.in_journey? }.from(false).to(true)
      end

     it 'will not touch in if below minimum balance' do
        expect{ subject.touch_in(station) }.to raise_error "Insufficient balance to touch in"
      end
    end
    
    describe '#touch_out' do
      it "changes @in_journey? to false when touched out" do
        subject.top_up(5)
        subject.touch_in(station)
        expect { subject.touch_out(station) }.to change { subject.in_journey? }.from(true).to(false)
      end
    
    
      it 'takes a charge when touching out' do
        expect{ subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
      end
    
      it 'stores the station' do
        subject.top_up(5)
        subject.touch_out(station)
        expect(subject.exit_station).to eq (station)
      end
    end

    
    it 'has a empty list of journeys by default' do
        expect(subject.journeys).to be_empty
    end

end