# frozen_string_literal: true

require 'date'
require 'optparse'

def calendar(month)
  year = Date.today.year
  puts Date.new(year, month, 1).strftime('%m月 %Y').center(20)
  puts %w[日 月 火 水 木 金 土].join(' ')

  last_date = Date.new(year, month, -1).day
  wday_first_date = Date.new(year, month, 1).wday
  print '   ' * wday_first_date

  (1..last_date).each do |date|
    print "#{date.to_s.rjust(2)} "
    wday_first_date += 1
    print "\n" if (wday_first_date % 7).zero?
  end
  print "\n"
end

opt = OptionParser.new
params = {}
opt.on('-m') { |v| params[:m] = v }
opt.parse!(ARGV)
v = ARGV[0].to_i

if ARGV[0] == '0'
  puts '0 is neither a month number 1..12 nor a name'
elsif v.zero?
  calendar(Date.today.mon)
elsif (1..12).include?(v)
  calendar(v)
else
  puts "#{v} is neither a month number 1..12 nor a name"
end
