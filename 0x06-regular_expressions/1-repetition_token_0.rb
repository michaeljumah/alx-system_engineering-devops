#!/usr/bin/env ruby
#Ruby script that accepts 1 agument,pass it t regular expression matching method
puts ARGV[0].scan(/hb+t{2,5}n/).join
