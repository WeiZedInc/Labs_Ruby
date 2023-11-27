def calculate_sum(x, n)
  x_lower_bound = 3.141 / 5
  x_upper_bound = 4 * 3.141 / 5
  n_lower_bound = 13
  n_upper_bound = 58
  epsilon = 0.001
  max_iterations = 100

  if x < x_lower_bound || x > x_upper_bound
    raise "X is out of bounds"
  end

  sum = 0

  if n >= n_lower_bound && n <= n_upper_bound
    (0..n).each do |i|
      sum += yield(x, i)
    end
  else
    fault = epsilon + 1
    prev_sum = sum
    i = 0

    while i < max_iterations && fault > epsilon
      sum += yield(x, i)

      i += 1
      fault = (prev_sum - sum).abs
      prev_sum = sum
    end
  end

  sum
end

def calculate_factorial_recursive(n)
  n <= 1 ? 1 : n * calculate_factorial_recursive(n - 1)
end

def calculate_series_f(i)
  Math.cos(i * 3.141 / 4) / calculate_factorial_recursive(i)
end

result = calculate_sum(0.9, 100) { |i| calculate_series_f(i) }
puts "Series sum: ", result, "\n"