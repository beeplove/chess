require './chess'

def help
  puts ""
  puts "main.rb <piece> <current position>"
  puts "example: main.rb knight b2"
  exit
end

piece = ARGV.shift || help
position = ARGV.shift || help

# TODO:
# - Validate the input
# - pass the input the library to get available move

board = Board.init_with_pieces([[piece, position]])
puts board.available_moves(position).inspect
