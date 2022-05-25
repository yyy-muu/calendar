# frozen_string_literal: true

require 'date'
require 'optparse'

def calendar(month)
  # 今年の西暦/引数で渡された月と曜日行を出力
  year = Date.today.year
  puts Date.new(year, month, 1).strftime('%m月 %Y').center(20)
  puts %w[日 月 火 水 木 金 土].join(' ')

  last_date = Date.new(year, month, -1).day

  # 月初日の曜日を整数で取得
  # 取得した値の個数に応じて空白を出力
  wday_first_date = Date.new(year, month, 1).wday
  print '   ' * wday_first_date

  # 月初日の曜日の整数値を、日付出力のループ処理の初期値とする
  wday_date = wday_first_date

  # 1日〜月末日までを出力
  (1..last_date).each do |date|
    print "#{date.to_s.rjust(2)} "
    # 月初日の曜日(整数値)に1ずつ足し、土曜日(7の倍数)に達したら改行
    wday_date += 1
    print "\n" if (wday_date % 7).zero?
  end
  print "\n"
end

OptionParser.new do |opt|
  opt.on('-m')
  opt.parse!(ARGV)
end

# コマンドライン引数(≠オプション)として渡された月を整数に変換
month = ARGV[0].to_i
if month.zero?
  calendar(Date.today.mon)
elsif (1..12).include?(month)
  calendar(month)
else
  puts "#{month} is neither a month number 1..12 nor a name"
end
