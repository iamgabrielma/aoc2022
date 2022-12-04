import Foundation

let testInput = [
    "vJrwpWtwJgWrhcsFMMfFFhFp",
    "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
    "PmmdzqPrVvPwwTWBwg",
    "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
    "ttgJtRGJQctTZtZT",
    "CrZsJsPPZsGzwwsLwLmpwMDw"]

if let data = Bundle.main.path(forResource: "input", ofType: "txt") {
    do {
        let data = try String(contentsOfFile: data, encoding: .utf8)
        input = data
    } catch {
        print("Couldn't read file")
    }
}

let treatedInput = input.components(separatedBy: "\n").compactMap { String($0) }
print(treatedInput)

func run(input: [String])  {
    
    var sumOfPriorities = 0
    
    for line in input {
        // Get each single line, and their compartments
        let compartmentSize = line.count/2
        var compartment1: [Character] = []
        var compartment2: [Character] = []
        
        for (index, char) in line.enumerated() {
            if index < compartmentSize {
                compartment1.append(char)
            } else {
                compartment2.append(char)
            }
        }
        
        // 2 Find common element:
        let commonElement = compartment1.filter(compartment2.contains)
        print(commonElement)
        
        
        // 3 Get priority
        var i = 0
        var priority = 0
        for char in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
            i += 1
            if char.description == commonElement.first?.description {
                priority = i
                sumOfPriorities += priority
            }
        }
        print(priority)
    }
    
    print(sumOfPriorities)
}

run(input: treatedInput)
