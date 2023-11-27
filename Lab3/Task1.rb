A = false
B = false
C = false
X = -8
Y = -10
Z = -12

# a) ¬(A ∨ B) ∧ (A ∧ ¬B)
def task_a(a, b)
  !(a || b) && (a && !b)
end

# b) (Z ≠ Y) ≤ (6 ≥ Y) ∧ A ∨ B ∧ C ∧ X ≥ 1.5
def task_b(z, y, a, b, c, x)
  (z != y) && (6 >= y) && (a || b || c) && (x >= 1.5)
end

# c) (8 – X * 2 ≤ Z) ∧ (X^2 <= Y^2) ∨ (Z ≥ 15)
def task_c(x, y, z)
  (8 - x * 2 <= z) && (x**2 <= y**2) || (z >= 15)
end

# d) X > 0 ∧ Y < 0 ∨ Z ≥ (X*Y + (-Y/X)) + (-Z)
def task_d(x, y, z)
  (x > 0) && (y < 0) || (z >= (x * y + (-y / x)) + (-z))
end

# e) ¬(A ∨ B ∧ ¬(C ∨ (¬A ∨ B)))
def task_e(a, b, c)
  !(a || (b && !(c || (!a || b))))
end

# f) X^2 + Y^2 ≥ 1 ∧ X ≥ 0 ∧ Y ≥ 0
def task_f(x, y)
  (x**2 + y**2 >= 1) && (x >= 0) && (y >= 0)
end

# g) (A ∧ (C ∧ (B != B ∨ A) ∨ C) ∧ B
def task_g(a, b, c)
  (a && (c && (b != b || a) || c)) && b
end

puts "Task A: #{task_a(A, B)}"
puts "Task B: #{task_b(A, B, C, X, Y, Z)}"
puts "Task C: #{task_c(X, Y, Z)}"
puts "Task D: #{task_d(X, Y, Z)}"
puts "Task E: #{task_e(A, B, C)}"
puts "Task F: #{task_f(X, Y)}"
puts "Task G: #{task_g(A, B, C)}"