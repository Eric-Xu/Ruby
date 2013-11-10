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

def caesar(s,n)s.gsub(/./){|c|l=c.ord;(l<97?(l+n-65)%26+65:(l+n-97)%26+97).chr}end
# def caesar(s,n)s.gsub(/./){|c|t=c.ord+n;(t-1)&31>25&&t+=n<0?26:-26;t.chr}end

def caesar_long(s,n)
	r, x, y = "", "a".ord, "A".ord
	s.each_char do |c|
		l = c.ord
		r << ( l<x ? (l+n-y)%26+y : (l+n-x)%26+x ).chr
	end
	r
end

def rps(m)o=%w(Rock Paper Scissors Rock);i=rand 3;"#{o[i]},#{o[i+1]==m ?:Win:o[i]==m ?:Draw: :Lose}"end

def rps_long(m)
	o = %w(Rock Paper Scissors).sample
	return "#{o},Draw" if m == o
	case m
	when "Rock"
		o == "Paper" ? "#{o},Lose" : "#{o},Win"
	when "Paper"
		o == "Scissors" ? "#{o},Lose" : "#{o},Win"
	when "Scissors"
		o == "Rock" ? "#{o},Lose" : "#{o},Win"
	end
end