import UIKit

var total_twos: Int = 0
var total_threes: Int = 0

func read(fileName: String) -> [String] {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else {
        return [String]()
    }
    
    do {
        let ids = try String(contentsOfFile: path).components(separatedBy: "\n")
        return ids
    } catch {
        return [String]()
    }
}

let box_ids  = read(fileName: "input")

func break_down(_ id: String) -> [Character: Int] {
    var destructured_id = [Character: Int]()
    for char in id {
        if destructured_id.keys.contains(char)  {
            if let value = destructured_id[char] {
                destructured_id[char] = value + 1
            }
        } else {
            destructured_id[char] = 1
        }
    }
    return destructured_id
}

func check_for_twos_and_threes(_ destructured_id: [Character: Int]) -> (Bool, Bool) {
    var count_two = false
    var count_three = false
    for (_, count) in destructured_id {
        if !count_two && count == 2 {
            count_two = true
        }
        if !count_three && count == 3 {
            count_three = true
        }
    }
    return (count_two, count_three)
}

func checksum() -> Int {
    for id in box_ids {
        let destructured_id = break_down(id)
        
        let count_two = check_for_twos_and_threes(destructured_id).0
        let count_three = check_for_twos_and_threes(destructured_id).1
        
        if count_two {
            total_twos += 1
        }
        
        if count_three {
            total_threes += 1
        }
    }
    
    return total_twos * total_threes
}

checksum()





