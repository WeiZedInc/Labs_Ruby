class Numeric
  def self.random
    rand(10)
  end
end

def generate_matrix(size)
  matrix = Array.new(size) { Array.new(size) { Numeric.random } }
  matrix.each_with_index { |row, i| row[i] = 1 } # Set diagonal elements to 1
  matrix
end

def generate_vector(size)
  Array.new(size) { Numeric.random }
end

def inner_product(x, y)
  raise "Vectors must have the same length" unless x.length == y.length

  product = 0
  x.each_index { |i| product += x[i] * y[i] }
  product
end

matrix_a = generate_matrix(8)
matrix_b = generate_matrix(8)

vector_x = generate_vector(8)
vector_y = generate_vector(8)

result = inner_product(vector_x, vector_y)
puts "Inner product of vectors X and Y: #{result}"