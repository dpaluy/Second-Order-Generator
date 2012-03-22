require 'weighted_probability'

class SignalGenerator
  
  attr_reader :arr, :p, :signals
  
  def initialize(p, initial_signals = [0, 0])
    @p = p
    @arr = initial_signals
    @signals = [0, 1]
  end

  def generate(amount)
    amount.times do
      p = calc_probability(@arr[-2..-1])
      @arr << signals.get_weighted_random_item(p)
    end    
  end

private

  def calc_probability(previous_signals)
    p0 = @p[previous_signals.join]
    p1 = get_complementary(p0)
    [p0, p1]
  end
  
  def get_complementary(p)
    (1-p)
  end  
    
end
