import UIKit

var current_frequency = 0
var current_frequency_list = Set<Int>()
var duplicated_frequency: Int?

func read(fileName: String) -> [Int] {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else {
        return [Int]()
    }
    
    do {
        let numbers = try String(contentsOfFile: path).components(separatedBy: "\n").compactMap {Int($0)}
        return numbers
    } catch {
        return [Int]()
    }
}

let frecuencies = read(fileName: "input")

// Function just used for first part of exercise puzzle1
func parse_frecuencies() -> Int{
    return frecuencies.reduce(current_frequency, +)
}
parse_frecuencies()

func search_for_second_time_frecuency() {

    for f in frecuencies {
        if current_frequency_list.contains(current_frequency) {
            duplicated_frequency = current_frequency
            break
        }
        current_frequency_list.insert(current_frequency)
        current_frequency += f
    }
}

func find_duplicated_frequency() -> Int {
    repeat {
        search_for_second_time_frecuency()
    } while (duplicated_frequency == nil)
    
    return duplicated_frequency!
}

find_duplicated_frequency()
