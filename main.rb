require 'signal_generator'
require 'date'
require 'time'
require 'dt_support'
require 'fileutils'

###########
#   MAIN  #
###########

@AMOUNT = 1000000
@OUTPUT_FOLDER = "result"
if File.directory? @OUTPUT_FOLDER
  puts "The folder #{@OUTPUT_FOLDER} is already exists. Please delete/rename this folder before start!"
  exit
else
  FileUtils.mkdir @OUTPUT_FOLDER
end

#    0    00   10
p = {'0' => 0.3, '0/0' => 0.8, '0/1' => 0.2}
signal = SignalGenerator.new(p)
signal.generate(@AMOUNT)

days = signal.arr.each_slice(1.day / 60).to_a

d = Date.new(2000, 1, 1)

days.each do |data|
  filename = "#{@OUTPUT_FOLDER}/#{d.strftime('%Y%m%d')}_second_order.csv"
  File.open(filename, 'w') do |f|
    t = Time.new(0)
    data.each do |e| 
      f.puts "#{t.strftime('%H:%M')},#{e}"
      t = t + 1.min
    end
  end
  d = d + 1
end

