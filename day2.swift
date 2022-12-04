import Foundation

var input = ""

if let data = Bundle.main.path(forResource: "day_2_input", ofType: "txt") {
    do {
        let data = try String(contentsOfFile: data, encoding: .utf8)
        input = data
    } catch {
        print("Couldn't read file")
    }
}

let treatedInput = input.components(separatedBy: "\n").compactMap { each in
    each.components(separatedBy: " ")
}

let testInput = [["A", "Y"], ["B", "X"], ["C", "Z"]]

enum Move {
    case rock, paper, scissors, none
}

struct Round {
    var opponent: Move?
    var player: Move?
}

enum Shape: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
    case none = 0
}

enum RoundResult: Int {
    case draw = 3
    case win = 6
    case loss = 0
}

class SecondGame {
    
    func run() {
        for each in treatedInput {
            switch(each.last) {
            case "X": // lose
                break
            case "Y": // draw
                each.first == each.last
            case "Z": // win
                break
            default:
                break
            }
        }
    }
}

class Game {
    
    var eachRoundScore: [Int] = []
    var playerScore: Int = 0
    
    func run() {
        var opponentMove: Move = .none
        var playerMove: Move = .none

        for each in treatedInput {
        //for each in testInput {
            switch(each.first) {
            case "A":
                opponentMove = .rock
            case "B":
                opponentMove = .paper
            case "C":
                opponentMove = .scissors
            default:
                print("fail opponentMove")
                break
            }
            
            switch(each.last) {
            case "X":
                playerMove = .rock
            case "Y":
                playerMove = .paper
            case "Z":
                playerMove = .scissors
            default:
                print("fail playerMove")
                break
            }
            
            round(opponentMove: opponentMove, playerMove: playerMove)
        }
        
        playerScore = eachRoundScore.reduce(0, +)
        print(playerScore)
    }
    
    func round(opponentMove: Move, playerMove: Move) {
        
        switch(opponentMove, playerMove) {
        // Lose cases:
        case (.rock, .scissors):
            playerScore(result: .loss, with: .scissors)
        case (.paper, .rock):
            playerScore(result: .loss, with: .rock)
        case (.scissors, .paper):
            playerScore(result: .loss, with: .paper)
            
        // Win cases:
        case (.rock, .paper):
            playerScore(result: .win, with: .paper)
        case (.paper, .scissors):
            playerScore(result: .win, with: .scissors)
        case (.scissors, .rock):
            playerScore(result: .win, with: .rock)

        // Draw cases:
        case (.rock, .rock):
            playerScore(result: .draw, with: .rock)
        case (.paper, .paper):
            playerScore(result: .draw, with: .paper)
        case (.scissors, .scissors):
            playerScore(result: .draw, with: .scissors)
        default:
            break
        }
    }
    
    func playerScore(result: RoundResult, with: Shape) {
        let score = result.rawValue + with.rawValue
        eachRoundScore.append(score)
        print(eachRoundScore.reduce(0, +))
    }
}

let game = Game()
game.run()

let secondGame = SecondGame()
secondGame.run()


