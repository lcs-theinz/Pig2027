//
//  PigView.swift
//  Pig
//
//  WHAT THIS GAME DOES NOW
//  Pig is a dice game for two players who share one laptop.
//  On your turn, roll the die as many times as you like.
//  Each roll adds to your turn total.
//  Roll a 1 and you lose your turn total, and your turn is over.
//  Click Hold to bank your turn total into your score and end your turn.
//
//  WHAT IT DOES NOT DO YET
//  Nobody can win! The scores just keep going up.
//  In the real game, the first player to reach 100 points wins.
//

import SwiftUI

// Each player has their own colour.
// TRY: Change these two colours. Try Color.purple, Color.green or Color.pink.
let playerOneColor: Color = Color.blue
let playerTwoColor: Color = Color.orange
let playerThreeColor: Color = Color.red
// The first player to reach this score wins.
let winningScore: Int = 100
// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct PigView: View {

    // MARK: - Stored properties

    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.

    // The points each player has banked. Banked points are safe.
    @State var playerOneScore: Int = 0
    @State var playerTwoScore: Int = 0
    @State var playerThreeScore: Int = 0
    // The points collected so far on this turn.
    // They are not safe until the player clicks Hold.
    @State var turnTotal: Int = 0

    // Whose turn it is: 1 or 2.
    @State var currentPlayer: Int = 1

    // The colour of whoever's turn it is.
    @State var turnColor: Color = playerOneColor

    // The name of the SF Symbol that shows the die.
    @State var dieSymbol: String = "questionmark.square.fill"

    // A message that tells the players what just happened.
    @State var message: String = "Player 1 goes first. Click Roll to start."
    @State var gameIsOver: Bool = false
    
    @State var diceRotation: Double =  0
    
    @State var startingPage: Bool = true
    
    @State var selectedPlayers = 2


    // MARK: - Computed properties

    var body: some View {
        
        VStack {
            
            if startingPage {

                VStack(spacing: 30) {

                    Image(systemName: "dice.fill")
                        .font(.system(size: 70))

                    Text("Pig")
                        .font(.system(size: 50, weight: .heavy))

                    Text("Choose Number of Players")
                        .font(.title2)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 20) {

                        Button {
                            selectedPlayers = 2
                        } label: {
                            Text("2 Players")
                                .frame(width: 150)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(selectedPlayers == 2 ? .blue : .gray)

                        Button {
                            selectedPlayers = 3
                        } label: {
                            Text("3 Players")
                                .frame(width: 150)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(selectedPlayers == 3 ? .blue : .gray)

                    }
                    .font(.title2)
                    .bold()

                    Button("Start Game") {
                        startingPage = false
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .font(.title2)

                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .padding(60)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 10)

                .frame(maxWidth: .infinity, maxHeight: .infinity)

                .background(
                    LinearGradient(
                        colors: [
                            Color.purple.opacity(0.15),
                            Color.blue.opacity(0.15)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

                .frame(minWidth: 480, minHeight: 680)

            
            } else {

                VStack(spacing: 12) {

                    // The title at the top of the screen.
                    VStack {

                        Image(systemName: "dice.fill")
                            .font(.system(size: 50))

                        Text("Pig")
                            .font(.system(size: 42,
                                          weight: .heavy))

                    }
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )

                    // The scoreboard: one card for each player.
                    HStack(spacing: 16) {
                        VStack {
                            Text("Player 1")
                                .font(.headline)
                            Text("\(playerOneScore)")
                                .font(.system(size: 48, weight: .bold))
                                .monospacedDigit()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            currentPlayer == 1
                            ? playerOneColor.opacity(0.45)
                            : playerOneColor.opacity(0.15)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 8
                        )
                        
                        VStack {
                            Text("Player 2")
                                .font(.headline)
                            Text("\(playerTwoScore)")
                                .font(.system(size: 48, weight: .bold))
                                .monospacedDigit()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            
                            currentPlayer == 2
                            ? playerTwoColor.opacity(0.45)
                            : playerTwoColor.opacity(0.15)
                            
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 8
                        )
                        
                        
                        if selectedPlayers == 3 {
                            
                            VStack {
                                Text("Player 3")
                                    .font(.headline)
                                
                                Text("\(playerThreeScore)")
                                    .font(.system(size: 48, weight: .bold))
                                    .monospacedDigit()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                currentPlayer == 3
                                ? Color.red.opacity(0.45)
                                : Color.red.opacity(0.15)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .shadow(
                                color: .black.opacity(0.1),
                                radius: 8
                            )
                        }
                    }

                    Spacer()

                    // Whose turn is it?
                    Text("Player \(currentPlayer), your turn")
                        .font(.title)
                        .bold()
                        .foregroundStyle(turnColor)

                    // The die.
                    // TRY: Change the size of the die from 120 to something bigger or smaller.
                    Image(systemName: dieSymbol)
                        .font(.system(size: 120))
                        .foregroundStyle(turnColor)
                        .rotationEffect(.degrees(diceRotation))

                    Text("Turn total: \(turnTotal)")
                        .font(.title2)
                        .bold()
                        .monospacedDigit()

                    Text(message)
                        .font(.headline)
                        .foregroundStyle(Color.secondary)
                        .multilineTextAlignment(.center)
                        .frame(minHeight: 44)

                    Spacer()

                    // The two buttons a player uses on their turn.
                    // The code inside the braces runs when that button is clicked.
                    HStack(spacing: 16) {
                        Button("Roll", systemImage: "hand.raised.fill") {
                            rollDie()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(gameIsOver)

                        Button("Hold", systemImage: "hand.raised.fill") {
                            hold()
                        }
                        .buttonStyle(.bordered)
                    }
                    .font(.title2)
                    .bold()
                    .controlSize(.large)
                    .tint(turnColor)

                    Button("New Game") {
                        startingPage = true 
                    }
                    if gameIsOver {
                        VStack (spacing: 20) {
                            
                            Image(systemName: "trophy.fill")
                                .font(.system(size: 80))
                                .foregroundStyle(.yellow)
                            
                            Text("Player \(currentPlayer) Wins!")
                                .font(.largeTitle)
                                .bold()
                            
                            Button("Play Again") {
                                startNewGame()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding(40)
                        .backgroundStyle(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                .background(

                    LinearGradient(

                        colors: [
                            Color.purple.opacity(0.15),
                            Color.blue.opacity(0.15)
                        ],

                        startPoint: .topLeading,
                        endPoint: .bottomTrailing

                    )

                )
                .padding(32)
                .fontDesign(.rounded)
                // How big the game's window is on the Mac. It can be made taller or wider.
                .frame(minWidth: 480, minHeight: 680)

            }
            
        }
        
    }

    // MARK: - Functions
    // Picks a random whole number from 1 to 6, just like a real die.
    func rollOneDie() -> Int {
        let roll: Int = Int.random(in: 1...6)
        return roll
    }
     
    // Answers true when a score is high enough to win.
    func hasWon(score: Int) -> Bool {
        return score >= winningScore
    }
    // Rolls the die once for the current player.
    func rollDie() {

        // Pick a random whole number from 1 to 6, just like a real die.
        let roll: Int = rollOneDie()

        // Show the matching die face. For a roll of 4, the symbol is "die.face.4.fill".
        dieSymbol = "die.face.\(roll).fill"

        if roll == 1 {
            // A 1 wipes out the turn total and ends the turn.
            message = "Oh no, a 1! Player \(currentPlayer) loses \(turnTotal) points."
            turnTotal = 0
            switchPlayer()
        } else {
            // Any other roll is added to the turn total.
            turnTotal += roll
            // TRY: Change this message.
            message = "You rolled a \(roll). Roll again, or hold?"
        }
        withAnimation(.easeInOut(duration: 0.4)){
            diceRotation += 360
        }
    }

    // Banks the turn total into the current player's score, then ends the turn.
    func hold() {
        if currentPlayer == 1 {
            playerOneScore += turnTotal
        }
        else if currentPlayer == 2 {
            playerTwoScore += turnTotal
        }
        else {
            playerThreeScore += turnTotal
        }
        
        // Has either player reached the winning score?
        let someoneHasWon: Bool =
        playerOneScore >= winningScore ||
        playerTwoScore >= winningScore ||
        playerThreeScore >= winningScore
        
        if someoneHasWon {
            message = "Player \(currentPlayer) wins! Click New Game to play again."
            dieSymbol = "trophy.fill"
            turnTotal = 0
            gameIsOver = true
        } else {
            message = "Player \(currentPlayer) banked \(turnTotal) points."
            turnTotal = 0
            switchPlayer()
        }
    }

    // Passes the turn to the other player.
func switchPlayer() {

    if selectedPlayers == 2 {

        if currentPlayer == 1 {
            currentPlayer = 2
            turnColor = playerTwoColor
        } else {
            currentPlayer = 1
            turnColor = playerOneColor
        }

    } else {

        if currentPlayer == 1 {
            currentPlayer = 2
            turnColor = playerTwoColor
        }
        else if currentPlayer == 2 {
            currentPlayer = 3
            turnColor = playerThreeColor
        }
        else {
            currentPlayer = 1
            turnColor = playerOneColor
        }

    }
}

    // Sets everything back to the way it was at the start.
    func startNewGame() {
        playerOneScore = 0
        playerTwoScore = 0
        playerThreeScore = 0
        turnTotal = 0
        currentPlayer = 1
        turnColor = playerOneColor
        dieSymbol = "questionmark.square.fill"
        message = "Player 1 goes first. Click Roll to start."
        gameIsOver = false
        diceRotation = 0
    }
}

#Preview {
    PigView()
}
