print "This program shows 'Polish postfix notation' for a given arithmetic expression.\n"
#print "Please note - spaces in expression are NOT permitted.\n"
print "Enter the expression, please: "
expr = gets.chomp
#expr.gsub! "-", "m"
  while expr.length == 0 || !expr.count("^1234567890+-/*() ").zero?
    print "Incorrect expression. Enter once more, please: "
    expr = gets.chomp
  end
expr.gsub! " ", ""
expr.gsub! "-", ",m,"
expr.gsub! "+", ",+,"
expr.gsub! "*", ",*,"
expr.gsub! "/", ",/,"
expr.gsub! "(", "(,"
expr.gsub! ")", ",)"
exprArr = expr.split(",")
#print exprArr

operationsStack = []
res = ""
tmp = ""



	exprArr.each do |el|
		if el.count("^1234567890").zero?
			res = res + el + " "
		elsif el.count("^(").zero?
			operationsStack << el
		elsif el.count("^+m/*").zero?
			if operationsStack.empty?
				operationsStack << el
			else
				loop do
					tmp = operationsStack.last
					if (!operationsStack.empty? && ((tmp.count("^/*").zero? && el.count("^/*m+").zero?) || (tmp.count("^+m").zero? && el.count("^+m").zero?)))
						tmp = operationsStack.pop
						res = res + tmp + " "
					else				
						operationsStack << el
						break
					end
				end
			end
		elsif el.include? ")"
				tmp = operationsStack.pop
				while !tmp.include? "("
					res = res + tmp + " "
					tmp = operationsStack.pop
				end
		end
	end

loop do 
	break if operationsStack.empty?
	tmp = operationsStack.pop
	res = res + tmp + " "
end

res.gsub! "m", "-"
print "The postfix notation is: "
puts res
