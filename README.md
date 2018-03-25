# Longest consecutive sum of primes
This is solution for Project Euler 50 in ruby

## Getting Started

These instructions will help you to run this solution.

### Prerequisites

You will need `rvm` to install ruby or if you already have it, skip the first line

### Installing
```
rvm install 2.4.2
gem install bundle
bundle
```

### Running task
You should check that file `find_longest_sum.rb` is executive
```
chmod +x find_longest_sum.rb
```
After that you can run task with command
```
./find_longest_sum.rb
```
You can pass limit for primes as parameter. Default value is 100
```
./find_longest_sum.rb 1_000_000
```
So output will look like
```
Max number of primes is 543
Sum is 997651
Performed in 1068 ms
```



If you don't want to make file executive you can do
```
ruby find_longest_sum.rb 1_000_000
```

## Running the tests

For tests we'll use rspec gem

```
rspec
```
