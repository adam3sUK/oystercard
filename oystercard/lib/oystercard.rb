class Oystercard
  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(num)
    fail "Cannot add this amount, limit: £#{LIMIT}" if limit_reached?(num)
    @balance += num
  end

  private

  def limit_reached?(num)
    (num + @balance) > LIMIT 
  end
  
end