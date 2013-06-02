def mccarthy(x)
  if x > 100
    puts "#{x - 10} since #{x} is greater than 100"
    x - 10
  elsif x <= 100
    puts "M(M(#{x + 11})) since #{x} is equal to or less than 100"
    mccarthy(mccarthy(x+11))
  end
end
