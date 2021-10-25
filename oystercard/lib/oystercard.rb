class Oystercard
  LIMIT = 90
  MIN = 1
  attr_reader :balance
  attr_accessor :journey

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(num)
    fail "Cannot add this amount, limit: £#{LIMIT}" if limit_reached?(num)
    @balance += num
  end

  def deduct(num)
    @balance -= num
  end

  def touch_in
    fail "Funds below minimum" if @balance < MIN
    @journey = true unless in_journey?
  end

  def touch_out
    @journey = false if in_journey?
  end

  private

  def limit_reached?(num)
    (num + @balance) > LIMIT 
  end

  def in_journey?
    @journey
  end
  
end