class Oystercard
  attr_reader :balance, :status

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

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @status
  end

  def touch_in
    raise "Minimum balance to touch in is £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    @status = true
  end

  def touch_out
    @status = false
  end
end