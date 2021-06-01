require 'oystercard'

describe Oystercard do
  it 'has a starting balance' do
    expect(subject.balance).to eq(0)
  end
end