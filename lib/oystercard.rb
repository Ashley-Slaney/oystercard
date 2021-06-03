class Oystercard
  attr_reader :balance, :status, :entry_station

  MIN_BALANCE = 1
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @status = false
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
    @status = true
    @entry_station = station
  end
  
  def touch_out
    deduct
    @status = false
    @entry_station = nil
  end

  private

  def deduct
    @balance -= MIN_BALANCE
  end
end
