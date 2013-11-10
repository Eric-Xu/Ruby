def fizzbuzz(n)(n%15<1?:FizzBuzz:n%3<1?:Fizz:n%5<1?:Buzz:n).to_s end
# def fizzbuzz(n)(n%3<1&&f="Fizz";n%5<1?"#{f}Buzz":f||n.to_s)end

def fizzbuzz_long(n)
	if n%3==0 && n%5==0
		"FizzBuzz"
	elsif n%3==0
		"Fizz"
	elsif n%5==0
		"Buzz"
	else
		n.to_s
	end
end
