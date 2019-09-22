print "This program calculates GCD of 2 numbers.\n"

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

#while a != 0 or b != 0
until a == 0 or b == 0
	if a > b
		a-=b
	else
		b-=a
	end
end

print "GCD of the given numbers is: "

if a == 0
	puts "#{b}"
else
	puts "#{a}"
end