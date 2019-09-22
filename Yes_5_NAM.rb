class Formula
	#attr_reader :left_side
	#attr_reader :right_side
	#attr_reader :final_expr
  def initialize(formula_string)  
     @left_side = formula_string.split(/ KEYWORD_ARROW/).first
     print @left_side
     print "\n"
	 @right_side = formula_string[/KEYWORD_ARROW (.*?) KEYWORD_END/, 1]
     print @right_side
     print "\n"
     @final_expr = formula_string.split(/KEYWORD_END /).last
     #@final_expr = formula_string[-1]
     #@final_expr = formula_string[/KEYWORD_ARROW (.*?) \n/, 1]
     #if (formula_string[-1] == "Y" || formula_string[-1] == "N")
     #	@final_expr = formula_string[-1]
     #end
     #if (final_expr.include? ("\n") )
     #	final_expr = final_expr.sub(/\n/, "")
     #end
     #@final_expr = formula_string[/KEYWORD_END (.*?) /, 1]
     if (@final_expr.include? "N")
     	@final_expr = "N"
     elsif (@final_expr.include? "Y")
     	@final_expr = "Y"
     end
     p @final_expr
     print "\n"
  end

  def left_side
  	@left_side
  end

  def right_side
  	@right_side
  end 

  def final_expr
  	@final_expr
  end  

end

class NAM
  def initialize(file_name, formulas_array)  
    generateFormulas(file_name, formulas_array)
  end

  def generateFormulas(file_name, formulas_array)
	num_of_line = 0
	text=File.open(file_name).read
	text.gsub!(/\r\n?/, "\n")
	text.each_line do |line|
	  
	  formula = Formula.new(line)
	  formulas_array[num_of_line] = formula
	  num_of_line += 1
	end

	#print "Number of formulas is: #{num_of_line}"

  end  

end

class Emulator
	def initialise()
	end

	def use(formulas_array, word)
		applicable = false
		#formulas_array.each { |formula|
		#	puts formula.left_side
		#}
		for i in 0..formulas_array.length-1
			#curr_formula = formulas_array[1]
			#print curr_formula.instance_variable_get("@#{left_side}")
			#print curr_formula.left_side

			#print formulas_array[i].left_side

		#beginning of applicability check
			if (word.include?(formulas_array[i].left_side) || formulas_array[i].left_side == "KEYWORD_EMPTY")
				applicable = true
			end
		end

		if (applicable == false)
			print "\n\nError: given algorithm is not applicable to the word."
			return word
		end
		#end of applicability check

		num_of_changes = 0
		final_calc = false
		exch = true

		while (exch == true)
			if (final_calc == true)
				print "\n\nTotal amount of exchanges is: "+"#{num_of_changes}"
				return word
			end

			exch = false

			for i in 0..formulas_array.length-1
				if (word.include?(formulas_array[i].left_side))
					if(formulas_array[i].final_expr == "Y")
						final_calc = true
					end

					print "\nAmount of exchanges: "+"#{num_of_changes}"+"|Current exchange: "+formulas_array[i].left_side+" - into - "+formulas_array[i].right_side+"|Current 'word': "+word
					word = word.sub(formulas_array[i].left_side, formulas_array[i].right_side)
					exch = true
					num_of_changes +=1
					#break
				elsif (formulas_array[i].left_side == "KEYWORD_EMPTY")
					if(formulas_array[i].final_expr == "Y")
						final_calc = true
					end

					print "\nAmount of exchanges: "+"#{num_of_changes}"+"|Current exchange: "+formulas_array[i].right_side+" - prepend to - "+word+"|Current 'word': "+word
					word = formulas_array[i].right_side + word
					exch = true
					num_of_changes += 1
					#break
				elsif (formulas_array[i].right_side == "KEYWORD_EMPTY")
					if(formulas_array[i].final_expr == "Y")
						final_calc = true
					end

					print "\nAmount of exchanges: "+"#{num_of_changes}"+"|Current exchange: "+formulas_array[i].left_side+" - delete from - "+word+"|Current 'word': "+word
					word = word.sub(formulas_array[i].left_side, "")
					exch = true
					num_of_changes += 1
					#break
				end


				if (exch == true)
					break
				end
			end
		end
		print "\n\nTotal amount of exchanges is: "+"#{num_of_changes}"
		return word
	end

end

#================================================================main program below===============================================================================================
print "This program emulates 'Markov algorithm' for a given '.txt' file and a 'word', entered by user.\n"
#print "NOTE: correct '.txt' file structure is as follows: >>first_expr KEYWORD_ARROW second_expr KEYWORD_END N (or Y)<<. N.B.: 'first_expr' and 'second_expr' can be equal to 'KEYWORD_EMPTY'\n\n".
print "Enter the name of a '.txt' file containing algorithm, please: "

correct_file_name = gets.chomp
	if (!correct_file_name.include? ".txt") 
		correct_file_name = "#{correct_file_name}"+'.txt'
	end
while (!File.file?(correct_file_name))
	print "Re-enter a correct name of the '.txt' file containing algorithm, please: "
	correct_file_name = gets.chomp
		if (!correct_file_name.include? ".txt") 
		correct_file_name = "#{correct_file_name}"+'.txt'
	end
end

formulas_array = Array.new
NAMobj = NAM.new(correct_file_name, formulas_array)


	#print formulas_array

print "\nEnter the 'word', please: "
word = gets.chomp
while (word == "")
	print "Re-enter a correct 'word', please: "
	word = gets.chomp
end

emu = Emulator.new()
res = emu.use(formulas_array, word)
print "\nThe resulting 'word' is: "+"#{res}"