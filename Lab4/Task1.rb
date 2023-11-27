A = Array.new(24) { rand(-50..50) }

def sum_of_even_negative_and_odd_positive(array)
  sum_even_negative = 0
  sum_odd_positive = 0

  array.each do |number|
    if number < 0 && number.even?
      sum_even_negative += number
    elsif number > 0 && number.odd?
      sum_odd_positive += number
    end
  end

  [sum_even_negative, sum_odd_positive]
end

result = sum_of_even_negative_and_odd_positive(A)
puts "Sum of even negative numbers: #{result[0]}"
puts "Sum of odd positive numbers: #{result[1]}"
