import Foundation

struct Board {
    
    static var defaultPosition:  [Square: Piece] {
        return [Square: Piece]()
    }
    
    var position = [Square: Piece]()
    var pieceMap = [String: [Square]]()
    var inCheck = false
    
    init() {
        self.position = Board.defaultPosition
    }
    
    init(position: [Square: Piece]) {
        self.position = Board.defaultPosition
    }
}

extension Board {
    
    func canMakeMove(move: String, color: Color, sourceSquare: String? = nil) -> Bool {
        return true
    }
    
    mutating func makeMove(color: Color, move: String, Color: Color, sourceSquare: String? = nil) {
        let pieceNotation = String(move.first!)
        let piece = PieceFactory.pieceFor(notation: pieceNotation)
       
        guard let fromSquares = pieceMap["\(color)\(pieceNotation)"],  let toSquare = Square(notation: String(move.dropFirst())) else {
            fatalError()
        }
        if let sourceSquare = sourceSquare, let fromSquare = Square(notation: sourceSquare) {
            if !piece.canMove(from: fromSquare, to: toSquare, doesPieceExist: { position[$0] != nil }) {
                fatalError()
            }
        } else {
            for fromSquare in fromSquares {
                if !piece.canMove(from: fromSquare, to: toSquare, doesPieceExist: { position[$0] != nil }) {
                    fatalError()
                }
            }
        }
    }
    
    mutating func checkInCheck() -> Bool {
        inCheck = false
        return false
    }
}
