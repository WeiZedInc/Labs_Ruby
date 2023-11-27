def task_2
  sum = 0
  8.times.each { |i|
    sum += 1.0 / (3 ** i)
  }
  sum
end
puts "Task2: #{task_2}"

def task_3(x)
  print "\nEnter n:"
  n = gets.to_i

  sum = 0
  fact = 1
  n.times.each { |i|
    sum += (x ** i) / fact
    fact *= (i + 1)
  }
  sum
end


print "Enter x:"
x = gets.to_i
print "\nTask3: #{task_3(x)}"