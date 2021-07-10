import Foundation
struct Square: Hashable {
    let notation: String
    let file: Int
    let row: Int
    private let fileMap = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8]
    private let files = ["a", "b", "c", "d", "e", "f", "g", "h"]
    
    init?(notation: String) {
        let notationArr = Array(notation)
        if notationArr.count != 2 {
            return nil
        }
        guard let file = fileMap[String(notationArr[0])], let row = Int(String(notationArr[1])), row > 0 && row <= 8 else {
            return nil
        }
        self.file = file
        self.row = row
        self.notation = notation
    }
    
    init?(file: Int, row: Int) {
        if file <= 0 || file > 8 || row <= 0 || file > 8 {
            return nil
        }
        self.file = file
        self.row = row
        self.notation = "\(files[file - 1])\(row)"
    }
}

