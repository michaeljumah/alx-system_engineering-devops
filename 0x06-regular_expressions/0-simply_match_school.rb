#!/usr/bin/env ruby
#Ruby script that accepts 1 arg & pass to a regular expression matching method
puts ARGV[0].scan(/School/).join
