class LongestPrimeSum
  # this is implemantation of finding max cosecuetive primes
  # it requires primes array
  Result = Struct.new(:length, :sum)

  def initialize(primes)
    # you should pass array of primes as input
    @primes = primes
    @primes_sum = primes_sum.unshift(0)
  end

  def call
    Result.new(*greatest_sum)
  end

  private

  def primes_sum
    sum = 0
    @primes.map { |x| sum += x }
  end

  def greatest_sum
    length = 0
    sum = 0

    (length + 1).upto(@primes.size - 2) do |i|
      (i-(length + 1)).downto(0) do |j|
        break if culculate_sum(i, j) > @primes.last

        if @primes.include?(culculate_sum(i, j))
          length = i - j
          sum = culculate_sum(i, j)
        end
      end
    end

    [length, sum]
  end

  def culculate_sum(index1, index2)
    @primes_sum[index1] - @primes_sum[index2]
  end
end
