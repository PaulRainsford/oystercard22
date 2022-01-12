require 'oystercard'

describe Oystercard do 

    it 'has a balance of zero' do
        expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
        
        it 'can top up the balance' do
            expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
        end

        it 'raises an error if the maximum balance is exceeded' do
            maximum_balance = Oystercard::MAXIMUM_BALANCE
            subject.top_up(maximum_balance)
            expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
        end

    end

    describe '#touch_in' do

        it "changes @in_journey to true when touched in" do
          expect { subject.touch_in }.to change { subject.in_journey }.from(false).to(true)
        end
    end
    


end