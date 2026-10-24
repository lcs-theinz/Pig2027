#  Pig Dice Game

## Overview

Pig is a simple dice game where players compete to be the first to reach a target score, usually 100 points. Players take turns rolling a six-sided die and must decide whether to continue rolling to gain more points or hold and add their accumulated points to their total score.

# How to Play

## Rules

1. The game is played by two or more players.
2.OOn a player's turn, they may roll the die as many times as they wish.
3.EEach roll that is not a 1 is added to the player's turn score.
4.IIf the player rolls a 1:
  1. their turn score becomes 0.
  2.Their turn ends immediately.
5. At any time during their turn, a player may choose to hold:
  1. The turn score is added to their total score.
  2. The turn ends.
6. The first player to reach or exceed 100 points wins the game.

Features
Turn-based gameplay
Random dice rolling
Score tracking
Win condition detection
Simple and intuitive user interface
Example Turn

Roll: 4 → Turn score = 4
Roll: 6 → Turn score = 10
Roll: 3 → Turn score = 13
Hold → 13 points are added to the total score
Installation

Clone the repository:

git clone https://github.com/yourusername/pig-game.git
Navigate to the project directory:

cd pig-game
Run the game:

python pig.py
Controls

Roll: Roll the die and add to your turn score.
Hold: Bank your turn score and end your turn.
Winning the Game

The first player to reach 100 points wins the game.

Future Improvements

Multiplayer support
AI opponents
Graphical user interface (GUI)
Online multiplayer mode
Save and load game progress

