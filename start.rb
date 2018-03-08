require './chess'

def help
  puts ""
  puts "ruby start.rb"
  puts "example: ruby start.rb"
  exit
end

begin
  game = Game.new
  game.start

  board = game.board
  board.display

  puts board.piece('a7').inspect
  puts board.piece('a7').name
  puts board.piece('a7').white?

  puts board.piece('a1').inspect
  puts board.piece('a1').name
  puts board.piece('a1').white?



rescue ChessError => e
  puts e.message
rescue => e
  puts "Something went wrong!"
  puts e.inspect
end
