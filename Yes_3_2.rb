print "This program informs whether the entered pair of numbers is amicable or not (permissible values' range is 1-10000).\n"

print "Enter the first number, please: "
numA = gets.to_i

  while "#{numA}".length == 0 || numA < 1 || numA > 10000
    print "Permissible values' range is 1-10000. Enter once more, please: "
    num = gets.to_i
  end

print "Enter the second number, please: "
numB = gets.to_i

  while "#{numB}".length == 0 || numB < 1 || numB > 10000
    print "Permissible values' range is 1-10000. Enter once more, please: "
    numB = gets.to_i
  end

resA = 0
resB = 0
tmp = 0
  for a in 1...numA
    while (tmp < numA)
      tmp+=a
    end
    if tmp == numA
      resA+=a
    end
    tmp = 0
  end

  for a in 1...numB
    while (tmp < numB)
      tmp+=a
    end
    if tmp == numB
      resB+=a
    end
    tmp = 0
  end

if resA == numB && resB == numA
  print "Entered pair of numbers is amicable!"
else
  print "Entered pair of numbers is not amicable."
end