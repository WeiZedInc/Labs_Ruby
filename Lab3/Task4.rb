EPS = 0.00001

def factorial n
  n > 1 ? n * factorial(n - 1).to_f : 1
end

def sum1
  sum = 0.0
  n = 2
  num = 0
  while num < EPS
    num = (factorial(n - 1) / factorial(n + 1)) ** (n * (n + 1))
    sum += num
    n += 1
  end
  sum
end

def sum2(x)
  n = 0
  sum = 0.0
  num = 1.0
  while num > EPS
    num = (x ** n) / factorial(n)
    sum += num
    n += 1
  end
  sum
end

def sum3
  n = 1
  num = 1
  sum = 0
  while num > EPS
    num = factorial(4 * n - 1) * factorial(2 * n - 1) / (factorial(3 * n) * (3 ** (2 * n)) * factorial(n))
    sum += num
    n += 1
  end
  sum
end



puts "Task 1: #{sum1}"
puts "Enter number for task 2: "
x = gets.chomp.to_i
puts "Task 2: #{sum2(x)}"
puts "e^x = #{ Math::E ** x }"
puts "Task 3: #{sum3}"