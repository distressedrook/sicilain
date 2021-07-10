import Foundation
enum Color: String {
    case white = "w", black = "b"
    var opponent: Color {
        if self == .white {
            return .black
        }
        return .white
    }
}
