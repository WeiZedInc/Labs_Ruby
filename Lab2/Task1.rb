
points = [
  [62, 300], [105, 303], [159, 304], [217, 303], [257, 302],
  [320, 292], [373, 280], [421, 234], [439, 187], [449, 144],
  [430, 107], [403, 78], [354, 65], [298, 54], [208, 49],
  [169, 42], [113, 45], [79, 67], [66, 123], [59, 156],
  [65, 198], [104, 202], [147, 220], [153, 242], [131, 249],
  [87, 256], [71, 267]
]

l = points.length

sum = 0
l.times do |i|
  p1 = points[i]
  p2 = points[(i + 1) % l]
  sum += (p1[0] + p2[0]) * (p1[1] - p2[1])
end

square = 0.5 * sum.abs
puts square

# https://onecompiler.com/ruby