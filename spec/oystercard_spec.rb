require 'oystercard'

describe Oystercard do

  it 'has a starting balance' do
    expect(subject.balance).to eq(0)
  end

  context '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'allows the user to top up their card' do
      subject.top_up(20)
      expect(subject.balance).to eq(20)
    end

    it 'has a max limit of £90' do
      subject.top_up(30)
      expect { subject.top_up(61) }.to raise_error("The maximum limit is £#{Oystercard::MAX_BALANCE}")
    end

    it 'does not fail with £90 top up' do
      subject.top_up(40)
      subject.top_up(50)
      expect(subject.balance).to eq(90)
    end
  end

  context '#deduct' do

    it { is_expected.to respond_to(:deduct).with(1).argument }
    
    it 'can deduct the specified amount from the card' do
      subject.top_up(40)
      expect { subject.deduct(7) }.to change { subject.balance }.by -7
    end
  end

  context '#in_journey?' do

    it { is_expected.to respond_to(:in_journey?) }

    it 'displays false when not in journey' do
      expect(subject).not_to be_in_journey
    end

    it 'displays true when touched in (in journey)' do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'displays false when touched out (not in journey)' do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  context '#touch_in' do

    it 'raises error when balance is less than the minimum balance' do
      expect { subject.touch_in }.to raise_error("Minimum balance to touch in is £#{Oystercard::MIN_BALANCE}")
    end

  end
end