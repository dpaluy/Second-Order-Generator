require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end
