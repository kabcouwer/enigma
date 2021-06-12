require 'date'

class Offset
  attr_reader :date_as_number

  def initialize(date)
    @date_as_number = nil
    generate_date_as_number(date)
  end

  def generate_date_as_number(date)
    if date == 'today' || date == Date.today
      date = Date.today
      month = date.month.to_s.rjust(2, "0")
      day = date.day.to_s.rjust(2, "0")
      year = date.year.to_s[-2..-1]
      @date_as_number = (day + month + year).to_i
    else
      @date_as_number = date.to_i
    end
  end

  def create_A_B_C_D_offset
    square = (@date_as_number ** 2).to_s
    array = square.chars.last(4)
    offset = array.map do |num|
      num.to_i
    end
  end
end
