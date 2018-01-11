Given standard algebraic notation of the a chess board, write code that will:

Accept two parameters:
1. Type of chess piece (Queen, Rook, Knight)
2. Current position on a chess board (for example: d2)

Return:
A list of all the potential board positions the given piece could advance to, with one move, from the given position, with the assumption there are no other piece on the board.

Rules:
- No need to implement the solution for every piece type, but the solution must implement at least the following: Queen, Rook and Knight.
- May not be use any external/non-core libraries: use only primitives and built-ins for the chosen language.
- Please provide test coverage

Example:
If the code is passed: "knight, d2", outout should be: "b1, f1, b3, f3, c4, e4"
