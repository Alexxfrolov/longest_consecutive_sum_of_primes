class EratosthenSieve
  # this is implemantation of Eratosthens sieve
  # it includes following improvements

  # The array nums only tracks odd numbers (skips multiples of 2).
  # The array nums holds booleans instead of integers, and every multiple of 3 begins false.
  # The outer loop skips multiples of 2 and 3.
  # Both inner loops skip multiples of 2 and 3.
  class ArgumentError < StandardError; end

  def initialize(limit)
    raise ArgumentError.new('Pass correct limit') unless limit && limit > 2

    @limit = limit

    @bools = []
    @primes = []
  end

  def call
    initialize_bool_array!
    sieve!
    convert_bool_to_primes!
  end

  private

  def initialize_bool_array!
    # we try to fasten aratosthens algorithm
    # in initial algorithm we would do [false] * n
    @bools = [true, false, true] * ((@limit + 5) / 6)
    @bools[0] = false  # 1 is not prime
    @bools[1] = true   # 2 is prime

    @bools
  end

  def sieve!
    # Outer loop and both inner loops are skipping multiples of 2 and 3.
    # Outer loop checks i * i > n, same as i > Math.sqrt(n).

    i = 5
    until (m = i * i) > @limit
      if @bools[i >> 1]
        i_times_2 = i << 1
        i_times_4 = i << 2
        while m <= @limit
          @bools[m >> 1] = false
          m += i_times_2
          @bools[m >> 1] = false
          m += i_times_4  # When i = 5, skip 45, 75, 105, ...
        end
      end
      i += 2
      if @bools[i >> 1]
        m = i * i
        i_times_2 = i << 1
        i_times_4 = i << 2
        while m <= @limit
          @bools[m >> 1] = false
          m += i_times_4  # When i = 7, skip 63, 105, 147, ...
          @bools[m >> 1] = false
          m += i_times_2
        end
      end
      i += 4
    end

    @bools
  end

  def convert_bool_to_primes!
    @primes = [2]

    @bools.each_index { |i| @primes << (i * 2 + 1) if @bools[i] }
    @primes.pop while @primes.last > @limit

    @primes
  end
end
