require 'oystercard'

describe Oystercard do

  let(:station) { double(:station) }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

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

  context '#in_journey?' do

    it { is_expected.to respond_to(:in_journey?) }

    it 'displays false when not in journey' do
      expect(subject).not_to be_in_journey
    end

    it 'displays true when touched in (in journey)' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'displays false when touched out (not in journey)' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end
  end

  context '#touch_in' do

    it 'raises error when balance is less than the minimum balance' do
      expect { subject.touch_in(station) }.to raise_error("Minimum balance to touch in is £#{Oystercard::MIN_BALANCE}")
    end

    it 'remembers the entry station' do
      subject.top_up(10)
      expect(subject.touch_in(station)).to eq(station)
    end
    
    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)
    end
  end

  context '#touch_out' do

    it 'reduces the balance on touch out' do
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::MIN_BALANCE)
    end
  end

  context '#journeys' do

    let(:journey){ { entry_station: entry_station, exit_station: exit_station } }

    it 'starts as an empty hash' do
      expect(subject.journeys).to be_empty
    end

    it 'stores a journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include(journey)
    end
  end
end
