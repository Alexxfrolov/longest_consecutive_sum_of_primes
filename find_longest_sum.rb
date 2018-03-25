#!/usr/bin/env ruby
# this is my solution for Project Euler 50

require_relative 'lib/eratosthen_sieve'
require_relative 'lib/longest_prime_sum'

limit = ARGV[0] || 100

t = Time.now
primes = EratosthenSieve.new(limit.to_i).call
result = LongestPrimeSum.new(primes).call
took = ((Time.now - t) * 1000.0).round

puts "Max number of primes is #{result.length}\nSum is #{result.sum}\nPerformed in #{took} ms"
