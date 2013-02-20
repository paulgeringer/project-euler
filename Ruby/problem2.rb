def fib(n)
    if n <= 1
        return 1
    else
        return fib(n-1) + fib(n-2)
    end
end

#puts fib(1000)

def fibopt(n)
    i = 0
    fibnum = [1,1]
    while i < n 
        fibnum += [fibnum[-1] + fibnum[-2]]
        i += 1
    end 
    fibnum
end

def fibopter(n)
    fibnum = [1,1]
    while (fibnum[-1] + fibnum[-2]) < n
        fibnum += [fibnum[-1] + fibnum[-2]]
    end
    fibnum
end

def evennum(list)
    evenlist = []
    list.each do |n|
        if n % 2 == 0
            evenlist += [n]
        end
    end
    evenlist
end

puts "#{evennum(fibopter(4000000)).inject(:+)}"
