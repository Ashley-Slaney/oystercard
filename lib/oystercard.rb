class Oystercard
  attr_reader :balance, :entry_station, :journeys

  MIN_BALANCE = 1
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "The maximum limit is £#{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end
  
  def touch_in(station)
    raise "Minimum balance to touch in is £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    @entry_station = station
  end
  
  def touch_out(station)
    deduct
    journeys << { entry_station: @entry_station, exit_station: station }
    @entry_station = nil
  end

  private

  def deduct
    @balance -= MIN_BALANCE
  end
end
