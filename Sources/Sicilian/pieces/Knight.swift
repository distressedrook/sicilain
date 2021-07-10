import Foundation

struct Knight: Piece {
    var specialMoves = [SpecialMove]()
    func canMove(from fromSquare: Square, to toSquare: Square, doesPieceExist: (Square) -> Bool) -> Bool {
        let possibleSquares = [
            Square(file: fromSquare.file - 2, row: fromSquare.row - 1),
            Square(file: fromSquare.file - 2, row: fromSquare.row + 1),
            Square(file: fromSquare.file + 2, row: fromSquare.row - 1),
            Square(file: fromSquare.file + 2, row: fromSquare.row + 1),
            Square(file: fromSquare.file - 1, row: fromSquare.row - 2),
            Square(file: fromSquare.file - 1, row: fromSquare.row + 2),
            Square(file: fromSquare.file + 1, row: fromSquare.row - 2),
            Square(file: fromSquare.file + 1, row: fromSquare.row + 2)
        ]
        return possibleSquares.contains(toSquare)
    }
    
    var notation: String {
        return "N"
    }
}
