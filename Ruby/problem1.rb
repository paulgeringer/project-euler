class MultipleGetter
    def initialize(maxint)
        @mult_list = []
        @all_ints = (1..maxint-1).to_a
    end
    def multiples(int1,int2)
        @all_ints.each do |i|
            if i % int1 == 0 || i % int2 == 0
                @mult_list += [i]
            end
        end
        @mult_list
    end
end

class Summerer
    def initialize(listtosum)
        @total = listtosum.inject(:+)
    end
    def summation
        @total
    end
end

totallist = MultipleGetter.new(1000).multiples(3,5)
sum = Summerer.new(totallist).summation
puts sum
