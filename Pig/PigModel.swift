import Foundation
import class ObjectLibrary.Player
import enum ObjectLibrary.Die

protocol PigModelDelegate: class {
    // TODO: - Define a method to update the UI in the event of a roll here
    func updateUI(die: String)
    func update(_ pointsRolled: Int)
    func updateScore(for player: Player)
    func willChange(player: Player)
    func updateGameLog(text: String)
    func notifyWinner(alerTitle: String, message: String, actionTitle: String)
}

final class PigModel {
    // MARK: - Properties

    private let players: [Player]
    private weak var delegate: PigModelDelegate?
    /**
     // HINT: -
     -
     - Set a breakpoint in your implementation of the `willChange(player: Player)` method and note how
     it is called every time `isPlayerTwosTurn` is mutated.
     
     Property observers observe and respond to changes in a property’s value. They are called every time a
     property’s value is set, even if the new value is the same as the property’s current value. They can
     be added to any stored properties you define, except for lazy stored properties. There are two kinds:
     - `willSet` is called just before the value is stored.
     - `didSet` is called immediately after the new value is stored.
     */
    private var isPlayerTwosTurn: Bool = false { didSet { delegate?.willChange(player: currentPlayer) }}
    /// Convenience variable for tracking total number of points accumulated in a turn before holding.
    private var pointsRolled: Int = 0
    /**
     Convenience variable for accessing the current player
     
     The original code for the Cocoa frameworks came from the NeXTSTEP libraries Foundation and AppKit (those
     names are still used by Apple's Cocoa frameworks). Because Objective-C is an extension of C and thus
     doesn't have namespaces like C++ (ex: std::); symbols must be prefixed with a unique identifier so that
     they don't collide.
     When Swift code imports Objective-C APIs; the importer replaces (aka bridges) Foundation reference types
     with their corresponding value types. For this reason, you should almost never need to use a bridged
     reference type directly in your own code.
     The below casting of the `Bool` `isPlayerTwosTurn` to a `NSNumber` allows us to access the `Bool`'s
     underlying binary value (i.e. 0 or 1, which is not available on Swift 5.0+'s Objective-C bridged `Bool`
     data structure) and convert it to an `Int` to then be utilized as an array index.
     */
    private var currentPlayer: Player { players[Int(truncating: isPlayerTwosTurn as NSNumber)] }
        
    init(delegate: PigModelDelegate) {
        self.delegate = delegate
        players = Player.Identifier.allCases.map { Player(id: $0) }
    }
    
    // MARK: - Public methods for use by `PigViewController`
    
    func beginNewGame() {
        pointsRolled = 0
        players.forEach {
            $0.resetTotalPoints()
            delegate?.updateScore(for: $0)
        }
        isPlayerTwosTurn = false
        let newGameText = "Welcome to Pig: Player 1, It's your turn!"
        let icon = "icon"
        delegate?.updateGameLog(text: newGameText)
        delegate?.updateUI(die: icon)
        delegate?.updateScore(for: currentPlayer)
        }
    
    func roll() {
       
        let number = Int.random(in: 0 ... 5) + 1
        
        if number == 1 {
            delegate?.updateUI(die: "one")
        } else if number == 2 {
            delegate?.updateUI(die: "two")
        } else if number == 3 {
            delegate?.updateUI(die: "three")
        } else if number == 4 {
            delegate?.updateUI(die: "four")
        } else if number == 5 {
            delegate?.updateUI(die: "five")
        } else if number == 6 {
            delegate?.updateUI( die: "six")
        } else if number == nil {
            delegate?.updateUI( die: "icon")
        }
        
        pointsRolled = number
        delegate?.update(pointsRolled)
        currentPlayer.updateScore(byAdding: pointsRolled)
        delegate?.updateGameLog(text: "\(currentPlayer.name) rolled a \(pointsRolled)")
        
        delegate?.updateScore(for: currentPlayer)
        
        if currentPlayer.totalPoints >= 100 {
            delegate?.notifyWinner(alerTitle: "Game Over!", message: "Player \(currentPlayer.name) is victorious! Press Ok to start a new game.", actionTitle: "Ok ")
        }
                    
        if isPlayerTwosTurn == false {
            isPlayerTwosTurn = true
        } else {
            isPlayerTwosTurn = false
        }
        
    }
    
    func hold() {
        /**
         // TODO: - Implement this method to add the `pointsRolled` to the `currentPlayer`'s `totalPoints`
         -
         // HINT: -
         -
         - Be sure to update the `currentPlayer`s score (`ctrl + cmd + click` on the `Player` object to view
         available methods for performing this task)
         - Be sure to update the UI with the player's new score
         - Perform the necessary checks to see if a user has reached the threshold of points to win the game
         - Be sure to switch players and reset the model/ UI appropriately for the next player's turn
         - Try using the instance method `toggle()` on `isPlayerTwosTurn` to switch players
         - Be sure to update the game log
         */
        
        pointsRolled = 0
        delegate?.update(pointsRolled)
        currentPlayer.updateScore(byAdding: pointsRolled)
        delegate?.updateGameLog(text: "\(currentPlayer.name) decided to hold!")
        
        if currentPlayer.totalPoints >= 100 {
            delegate?.notifyWinner(alerTitle: "Game Over!", message: "(currentPlayer.name) is victorious! Press Ok to start a new game.", actionTitle: "Ok ")
        }
        
        delegate?.updateScore(for: currentPlayer)

        if isPlayerTwosTurn == false {
            isPlayerTwosTurn = true
        } else {
            isPlayerTwosTurn = false
        }
    }
    
    /**
     // TODO: - If you have any other methods, write them here
     -
     */
}
