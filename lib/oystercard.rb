class Oystercard
  attr_reader :balance, :status

  MAX_LIMIT = 90

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    fail "The maximum limit is £#{MAX_LIMIT}" if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @status
  end

  def touch_in
    @status = true
  end

  def touch_out
    @status = false
  end
end