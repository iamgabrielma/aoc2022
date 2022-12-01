/// https://adventofcode.com/2022/day/1
///
import Foundation

var treatedInput: [[String]] = []

if let data = Bundle.main.path(forResource: "day_1_input", ofType: "txt") {
    do {
        let data = try String(contentsOfFile: data, encoding: .utf8)
        // Separate lines twice, so we get rid of the white spaces
        // Make 2D array for each Elf
        treatedInput = data.components(separatedBy: "\n\n").map { input in
            input.components(separatedBy: "\n")
        }
    } catch {
        print("Couldn't read file")
    }
}

func getElfThatCarriesMoreWeight(input: [[String]]){
    var intArray: [Int] = []
    for each in input {
        // Convert each value to Int, then sum them
        let i = each.map { Int($0) ?? 0 }.reduce(0, +)
        intArray.append(i)
    }
    // Top 1
    let top1 = intArray.sorted(by: >).prefix(1).first
    // Sum of Top 3
    let top3 = intArray.sorted(by: >).prefix(3).reduce(0, +)
    
    print("Top 1: \(String(describing: top1))")
    print("Sum of Top 3: \(top3)")
}

getElfThatCarriesMoreWeight(input: treatedInput)
