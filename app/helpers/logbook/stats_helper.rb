module Logbook::StatsHelper
  def totalize(array)
    array = array.to_a
    total = 0
    array.each do |p|
      total += p[1]
      p[1] = total
    end
    array
  end

end
