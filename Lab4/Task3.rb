def solve_gauss
  input = gets.chomp.to_i
  if input < 3 || input > 9
    raise "Input is out of bounds"
  end

  result = Array.new(input){|index| index + 1}
  matrix = (0..input - 1).map{Array.new(input - 1)}
  matrix.size.times do |i|
    matrix.size.times do |j|
      if i == j
        matrix[i][j] = 2.0
      else
        matrix[i][j] = 8.0
      end
    end
  end

  puts matrix.map(&:inspect), "\n"

  matrix.size.times do |i|
    coefficient = matrix[i][i]
    matrix.size.times do |j|
      matrix[i][j] /= coefficient
    end
    result[i] /= coefficient
    matrix.size.times do |j|
      if j != i
        coefficient1 = matrix[j][i] / matrix[i][i]
        matrix.size.times do |k|
          matrix[j][k] -= matrix[i][k] * coefficient1
        end
        result[j] -= result[i] * coefficient1
      end
    end
    puts matrix.map(&:inspect), "\n"
  end

  result
end

print solve_gauss, "\n"