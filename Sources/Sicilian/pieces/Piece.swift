import Foundation
protocol Piece {
    var specialMoves: [SpecialMove] { get set }
    var notation: String { get }
    
    func canMove(from fromSquare: Square, to toSquare: Square, doesPieceExist: (Square) -> Bool) -> Bool
}

struct PieceFactory {
    static func pieceFor(notation: String) -> Piece {
        switch notation.capitalized {
        case "N":
            return Knight()
        case "R":
            return Rook()
        default:
            return Knight()
        }
    }
}

