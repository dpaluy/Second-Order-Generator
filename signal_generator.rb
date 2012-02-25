require 'extended_matrix'
require 'weighted_probability'

class SignalGenerator
  
  attr_reader :arr, :p, :signals
  
  def initialize(p)
    @p = calc_probability(p)
    @arr = []
    @signals = [0, 1]
  end

  def generate(amount)
    amount.times do
      @arr << signals.get_weighted_random_item(@p)
    end    
  end

private

  def calc_probability(p)
    m = Matrix.zero(2)
    m[0,0] = (p['0/0']*p['0']).round(2)
    m[0,1] = (p['0/1']*get_complementary(p['0'])).round(2)
    m[1,0] = (get_complementary(p['0/0'])*p['0']).round(2)
    m[1,1] = (get_complementary(p['0/1'])*get_complementary(p['0'])).round(2)
    p0 = (m[0,0] + m[0,1]).round(2)
    p1 = (m[1,0] + m[1,1]).round(2)
    [p0, p1]
  end
  
  def get_complementary(p)
    (1-p)
  end  
    
end
