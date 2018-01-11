def help
  puts ""
  puts "main.rb <piece> <current position>"
  puts "example: main.rb knight b2"
  exit
end

piece = ARGV.shift || help
current_position = ARGV.shift || help

# TODO:
# - Validate the input
# - pass the input the library to get available move
