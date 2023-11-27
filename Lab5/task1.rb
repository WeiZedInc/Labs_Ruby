def calculate_integral_rectangle(start, finish, num_intervals, dx=(finish - start)/num_intervals)
  x = start + dx / 2
  sum = 0
  (1..num_intervals).each do
    y = yield(x)
    sum += dx * y
    x += dx
  end
  sum
end

def calculate_integral_trapezoid(start, finish, num_intervals, dx=(finish-start)/num_intervals)
  x = start + dx
  sum = dx * (yield(start) / 2 - yield(finish) / 2)
  loop do
    y = yield(x)
    sum += dx * y
    x += dx
    break if x > finish
  end
  sum
end

def function_1(x)
  Math.asin(Math.sqrt(x)) / Math.sqrt(x*(1-x))
end

def function_2(x)
  Math.tan(x/2 + 3.141/4)**3
end

result = calculate_integral_rectangle(0.2, 0.3, 100000.0) {|x| function_1(x)}
puts "Rectangle 1: ", result, "\n" # -0.17698
result = calculate_integral_trapezoid(0.2, 0.3, 100000.0) {|x| function_1(x)}
puts "Trapezoid 1: ", result, "\n" # -0.17698

result = calculate_integral_rectangle(0.0, 3.141/8, 100000.0) {|x| function_2(x)}
puts "Rectangle 2: ", result, "\n" # 1.170995544
result = calculate_integral_trapezoid(0.0, 3.141/8, 100000.0) {|x| function_2(x)}
puts "Trapezoid 2: ", result, "\n" # 1.170995544