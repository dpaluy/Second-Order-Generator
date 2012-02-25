class Fixnum
 
  def min
    self * 60
  end
  
  def hour
    self * 60.min
  end
  
  def day
    self * 24.hour
  end
end
