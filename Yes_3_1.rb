print "This program informs whether the entered number is perfect or not (permissible values' range is 1-10000).\n"

print "Enter the number, please: "
num = gets.to_i

  while "#{num}".length == 0 || num < 1 || num > 10000
    print "Permissible values' range is 1-10000. Enter once more, please: "
    num = gets.to_i
  end

res = 0
tmp = 0
	for a in 1...num
		while (tmp < num)
			tmp+=a
		end
		if tmp == num
			res+=a
		end
		tmp = 0
	end
if res == num
	print "Entered number is perfect!"
else
	print "Entered number is not perfect."
end