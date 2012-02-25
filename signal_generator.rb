class SignalGenerator
  
  attr_reader :arr
  
  def initialize(p, first_signal = 1)
    @p = p
    @arr = [first_signal]
  end

  def generate(amount)
    amount.times do
      signal
    end    
  end

private

  def get_probability_1(p)
    (1-p)
  end  
  
  def signal
    result = rand 2
    @arr << result
    result
  end
  
end
