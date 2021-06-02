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
      expect { subject.top_up(61) }.to raise_error("The maximum limit is £#{Oystercard::MAX_LIMIT}")
    end

    it 'does not fail with £90 top up' do
      subject.top_up(40)
      subject.top_up(50)
      expect(subject.balance).to eq(90)
    end
  end

  context '#deduct' do
    
    it 'can deduct the specified amount from the card' do
      subject.top_up(40)
      subject.deduct(7)
      expect(subject.balance).to eq(33)
    end
  end
end