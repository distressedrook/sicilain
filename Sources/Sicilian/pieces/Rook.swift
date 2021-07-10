import Foundation

struct Rook: Piece, RookLike {
    var specialMoves: [SpecialMove] = [SpecialMove]()
    
    var notation: String {
        return "R"
    }
    
    func canMove(from fromSquare: Square, to toSquare: Square, doesPieceExist: (Square) -> Bool) -> Bool {
        return canMoveLikeRook(from: fromSquare, to: toSquare, doesPieceExist: doesPieceExist)
    }
}

protocol RookLike {
    func canMoveLikeRook(from fromSquare: Square, to toSquare: Square, doesPieceExist: (Square) -> Bool) -> Bool
}
extension RookLike {
    func canMoveLikeRook(from fromSquare: Square, to toSquare: Square, doesPieceExist: (Square) -> Bool) -> Bool {
        var currentCount = fromSquare.file
        while currentCount < 8 {
            currentCount += 1
            guard let square = Square(file: currentCount, row: fromSquare.row) else {
                return false
            }
            if square == toSquare {
                return true
            }
            if doesPieceExist(square) {
                return false
            }
        }
        
        currentCount = fromSquare.file
        while currentCount > 1 {
            currentCount -= 1
            guard let square = Square(file: currentCount, row: fromSquare.row) else {
                return false
            }
            if square == toSquare {
                return true
            }
            if doesPieceExist(square) {
                return false
            }
        }
        
        currentCount = fromSquare.row
        while currentCount < 8 {
            currentCount += 1
            guard let square = Square(file: fromSquare.file, row: currentCount) else {
                return false
            }
            if square == toSquare {
                return true
            }
            if doesPieceExist(square) {
                return false
            }
        }
        
        currentCount = fromSquare.row
        while currentCount > 1 {
            currentCount -= 1
            guard let square = Square(file: fromSquare.file, row: currentCount) else {
                return false
            }
            if square == toSquare {
                return true
            }
            if doesPieceExist(square) {
                return false
            }
        }
        return false
    }
}
