require 'signal_generator'
require 'date'
require 'time'
require 'dt_support'

###########
#   MAIN  #
###########
#    0    00   10
p = [0.3, 0.8, 0.2]
signal = SignalGenerator.new(p)
signal.generate(10000)

days = signal.arr.each_slice(1.day / 60).to_a

d = Date.new(2000, 1, 1)

days.each do |data|
  filename = "#{d.strftime('%Y%m%d')}_second_order.csv"
  File.open(filename, 'w') do |f|
    t = Time.new(0)
    data.each do |e| 
      f.puts "#{t.strftime('%H:%M')},#{e}"
      t = t + 1.min
    end
  end
  d = d + 1
end

