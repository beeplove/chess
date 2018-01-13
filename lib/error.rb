class ChessError < StandardError
end

class PositionError < ChessError
end

class CoordError < ChessError
end
