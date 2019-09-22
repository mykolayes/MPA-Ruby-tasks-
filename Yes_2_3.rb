print "This program counts amount of '1'-bits in a given number.\n"

print "Enter the number, please: "
a = gets.to_i
  while "#{a}".length == 0 || a <= 0 || a % 1 != 0
    print "Incorrect input. Enter once more, please: "
    a = gets.to_i
  end

b = a.to_s(2)
c = b.to_i
#c = "#{b}".scan(/(?=1)/).count
c = "#{c}".count("1")

print "The amount of '1'-bits in your number is: "

puts "#{c}"