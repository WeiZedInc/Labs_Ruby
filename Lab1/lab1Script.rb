# frozen_string_literal: true
include Math
#var 6

print "Enter x: \n"
$x = gets.chomp.to_f

print "Enter t: \n"
$t = gets.chomp.to_f

print "Enter Phi: \n"
$phi = gets.chomp.to_f

$result = Math.tan((Math.exp($t) + 3 ** $phi) / Math.sqrt($t**2 + 2))
- ((Math.cos($phi)**3 + 2.8 * 10**-3.4 + $x) / Math.sqrt((3.14 - 4) + 1.2)**5)

puts $result.to_s << "Result: "
# https://onecompiler.com/ruby