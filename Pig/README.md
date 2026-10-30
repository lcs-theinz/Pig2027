# Pig Dice Game

## Description
Pig is a turn-based dice game built with SwiftUI.
Players take turns rolling a die and trying to reach 100 points before their opponents. During a turn, a player may roll the die as many times as they want. Each roll adds to their turn total.
However, if a player rolls a 1, they lose all points earned during that turn and play passes to the next player.
Players can choose to Hold at any time, which adds their turn total to their overall score and ends their turn.
The first player to reach 100 points wins the game.

## Features
Supports 2-player and 3-player modes
Start screen with player selection
Animated dice rolling
Turn indicator highlighting the active player
Score tracking for all players
Win detection at 100 points
New Game button to restart the game
Winner screen with trophy display

## How to Play
Launch the game.
Select either 2 Players or 3 Players.
Click Start Game.
On your turn:
Click Roll to roll the die.
Keep rolling to increase your turn total.
Click Hold to bank your points.
If you roll a 1, you lose all points earned during that turn.
The first player to reach 100 points wins.

## How It Works
### Starting Page
Choose the number of players before the game begins. When the app first opens, it does not immediately show the game board. Instead, players are taken to a starting page where they can choose between a 2-player or 3-player game and then start a new match. The feature uses a @State var, startingPage, a Bool that remembers whether the user is currently on the menu screen or in the game. It also uses another @State var, selectedPlayers, an Int that stores the number of players chosen.
@State var startingPage: Bool = true
@State var selectedPlayers = 2
The main decision is found in body. SwiftUI checks the value of startingPage. If it is true, the starting page is shown. If it is false, the game screen is displayed instead.
if startingPage {
    // Starting page
} else {
    // Main game
}
The starting page contains two buttons that allow the user to select either 2 or 3 players. Pressing a button changes the value of selectedPlayers, and the selected option is highlighted in blue so the players can clearly see their choice.
selectedPlayers = 2
selectedPlayers = 3
When the Start Game button is clicked, the startNewGame() function resets all scores and game variables, and startingPage is set to false. Because these values are stored with @State, SwiftUI automatically updates the screen and switches from the menu to the game.
Button("Start Game") {
    startNewGame()
    startingPage = false
}
The value stored in selectedPlayers is then used throughout the rest of the program. For example, Player 3's score card is only displayed when a 3-player game is selected, and the switchPlayer() function uses this value to determine whether turns should alternate between two players or cycle through three players.
Why these tools: startingPage is a @State var because its value changes while the app is running and SwiftUI must update the interface when it changes. selectedPlayers is also a @State var because the player's choice needs to be remembered and used later in the game. Using an if statement to switch between the menu and game screen keeps the code simple and makes it easy to control the flow of the app.
## Author
Tom Hz

# Have Fun! 
