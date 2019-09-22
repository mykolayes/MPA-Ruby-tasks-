print "This program calculates the arithmetic expression written in'Polish postfix notation'.\n"
print "Enter the expression, please: "
expr = gets.chomp
#expr =  "2 7 6 4 / - * 10 3 * + 2 -"
  while expr.length == 0 || !expr.count("^1234567890+-/* ").zero?
    print "Incorrect expression. Enter once more, please: "
    expr = gets.chomp
  end

exprArr = expr.split(" ")
#print exprArr

resStack = []
res = 0
tmp = ""
operandTwo = 0
operandOne = 0

	exprArr.each do |el|
		if el.count("^1234567890").zero?
			resStack << el
		elsif el.count("^+-/*").zero?
			operandTwo = resStack.pop.to_f
			operandOne = resStack.pop.to_f
			resStack << operandOne.public_send(el, operandTwo)
		end
	end
res = resStack.pop
print "The result of calculation is: "
puts res