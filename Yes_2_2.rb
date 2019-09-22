print "This program does peasant multiplication of 2 numbers.\n"

print "Enter first number, please: "
a = gets.to_i
  while "#{a}".length == 0 || a <= 0 || a % 1 != 0
    print "Incorrect input. Enter once more, please: "
    a = gets.to_i
  end

print "Enter second number, please: "
b = gets.to_i
  while "#{b}".length == 0 || b <= 0 || b % 1 != 0
    print "Incorrect input. Enter once more, please: "
    b = gets.to_i
  end
  
  c = 0
 if a % 2 != 0
	c = b
end
#while a > 1
 until a == 1
	a/=2
	b*=2
	if a % 2 != 0
	c+=b
	end
end

print "The result of peasant multiplication is: "
puts "#{c}"