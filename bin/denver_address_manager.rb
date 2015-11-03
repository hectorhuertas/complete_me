require '../lib/complete_me'
require 'csv'

filename = ARGV[0]
completion = CompleteMe.new
CSV.foreach(filename){|row| completion.insert(row[-1])}
puts completion.suggest('1200 N N')
puts "Suggest: 1200 N Newton St Bldg B\n"
completion.select('1200 N N','1200 N Newton St Bldg B\n')
puts completion.suggest('1200 N N')
