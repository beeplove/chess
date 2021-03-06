require './chess'

def help
  puts ""
  puts "ruby main.rb <piece> <current position>"
  puts "example: ruby main.rb knight b2"
  exit
end

piece = ARGV.shift || help
position = ARGV.shift || help

begin
  board = Board.init_with_pieces([[piece, position]])
  moves = board.available_moves(position).collect { |coord|
    position = Board.position(coord)
    board.add_piece('pawn', position) # just for display purpose
    position
  }

  board.display
  puts "\n\n\n"
  puts moves.join(', ')

rescue ChessError => e
  puts e.message
rescue => e
  puts "Something went wrong!"
  puts e.inspect
end
