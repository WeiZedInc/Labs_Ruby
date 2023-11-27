PI_VALUE = 3.141
NUM_N = 15
NUM_C = 35

def calculate_y(x)
  begin
    return 2 * Math.sqrt(1 + (1/x) * (Math.sqrt(1/x - Math.sqrt(x))) ** 2) /
      (Math.sqrt(1 + (1/NUM_N) * (Math.sqrt(1/x - Math.sqrt(x)))) - 0.5 * Math.sqrt(1/x - Math.sqrt(NUM_N)))
  rescue
    return 0
  end
end

def calculate_z(x)
  ((Math.sin(x) ** 2 + Math.tan(x) ** 2) ** NUM_C + 1) * (Math.cos(x) ** 2 -  (1/Math.tan(x)) ** 2 + 1) /
    ((Math.cos(x) ** 2 + (1/Math.tan(x)) ** 2 + 1) * (Math.sin(x) ** 2 + (1/Math.tan(x)) ** 2 - 1))
end

def calculate_y_table
  result = {}
  (1..NUM_N).step((NUM_N - 1).to_f / (NUM_N + NUM_C)) do |i|
    puts i
    result[i] = calculate_y(i)
  end
  result
end

def calculate_z_table
  result = {}
  i = PI_VALUE / NUM_N
  delta = (PI_VALUE - PI_VALUE / NUM_N) / ((3.0/2)*NUM_N + NUM_C)
  while i <= PI_VALUE do
    result[i] = calculate_z(i)
    i += delta
  end

  result
end

def calculate_y_z_table
  result = {}
  (2..NUM_C).step((NUM_C - 2).to_f / (2*NUM_N)) do |j|
    if j > 2 && j < NUM_N
      result[j] = calculate_y(j)
    elsif j > NUM_N && j < 2*NUM_N
      result[j] = calculate_z(j)
    else
      result[j] = calculate_y(j) + calculate_z(j)
    end
  end

  result
end

def print_result(dictionary)
  dictionary.each { |i|
    print i.to_s + ": " + dictionary[i].to_s + "\n"
  }

  print "\n"
end


print "==================Y===================\n"
print_result(calculate_y_table)
print "==================Z===================\n"
print_result(calculate_z_table)
print "==================Y=Z===================\n"
print_result(calculate_y_z_table)