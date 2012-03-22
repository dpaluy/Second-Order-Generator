require 'signal_generator'

AMOUNT = 1000000
# Probability to 0 after given context
p = {'00' => 0.3, '01' => 0.8, '10' => 0.2, '11' => 0.6}
signal = SignalGenerator.new(p)
signal.generate(AMOUNT)
result = signal.arr
counter0 = {'00' => 0, '01' => 0, '10' => 0, '11' => 0}
counter1 = {'00' => 0, '01' => 0, '10' => 0, '11' => 0}
result.each_with_index do |v, i|
  if (i > 1)
    previous_signals = result[i-2..i-1].join
    if (v == 0)
      counter0[previous_signals] += 1 
    else
      counter1[previous_signals] += 1 
    end
  end
end

counter0.each do |v|
  a0 = v[1]
  a1 = counter1[v[0].to_s]
  percentage = a0.to_f/(a0+a1)
  puts "#{v[0]}: #{a0} | #{a1} - #{100 * percentage}%"
end
