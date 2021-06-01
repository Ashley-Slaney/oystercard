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
  end
end