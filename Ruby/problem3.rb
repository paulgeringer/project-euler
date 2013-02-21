def sieve(max)
    allnum = (2..max).to_a
    comp = []
    prime = []
    allnum.each do |num|
        if comp.include? num
            next
        end
        num2 = num * 2
        while num2 <= allnum[-1] do
            comp += [num2]
            num2 += num
        end
        if not comp.include? num 
            prime += [num]
        end
    end
    prime
end

def isprime(numb)
    allnum = (2..numb-1).to_a
    allnum.each do |num|
        if numb % num == 0
            return false
        end
    end
    return true
end

def primefactors(maxnum)
    factors = []
    allnum = 2..maxnum
    allnum.each do |num| # does too many iterations and is wildly inefficient
        if maxnum % num == 0 && isprime(num)
            factors += [num]
        end
    end
    factors
end

def primefactorsopt(maxnum)
    factors = []
    product = 1
    p = 2
    while product < maxnum
        if maxnum % p == 0 && isprime(p)
            factors += [p]
            product = p * product
        end
        p += 1
    end
    factors
end

puts "#{primefactorsopt(600851475143)}"
