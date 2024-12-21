# Tic-Tac-Toe Game in R

This is a simple command-line implementation of the classic Tic-Tac-Toe game, also known as Noughts and Crosses. The game allows a single player to play against the computer.

---

## Features

- Interactive player vs. computer gameplay.
- Input validation to ensure only valid moves are accepted.
- A simple AI that tries to block the player from winning and chooses optimal moves where possible.
- Displays the current state of the board after every move.

---

## How to Play

1. **Run the script**: Execute the script in an R environment (such as RStudio or the R terminal).
2. **Choose who starts**: The script will ask if you want to start the game. Enter `j` (yes) to start or `n` (no) to let the computer begin.
3. **Make your move**: Enter your move in the format `row,column` (e.g., `1,2` to place your mark in the top-middle position).
4. **Computer's turn**: The computer will make its move automatically.
5. **Game progress**: The game alternates between the player and the computer until:
   - Either the player or the computer wins, or
   - All positions on the board are filled (resulting in a draw).

---

## Functions Overview

### 1. `print_board(board)`
Displays the current state of the game board in a user-friendly format.

### 2. `choose_player()`
Asks the player if they want to start the game and returns `1` if the player starts or `2` if the computer starts.

### 3. `get_player_input(board)`
Prompts the player to enter a valid move. Ensures that the input is in the correct format and the selected position is unoccupied.

### 4. `get_computer_input(board, player)`
Calculates the optimal move for the computer:
   - Prioritizes moves that allow the computer to win.
   - Blocks the player from winning.
   - Otherwise, makes a random move.

### 5. `check_win(board, player)`
Checks if the specified player has won the game by examining rows, columns, and diagonals.

### 6. `play_game()`
The main game loop:
   - Alternates turns between the player and the computer.
   - Ends when either the player or the computer wins or the game results in a draw.

---

## Example Gameplay

### Starting the Game
```plaintext

```

### Board State During Gameplay
```plaintext
Geben Sie die Position für Ihren Zug ein (z.B. 1,1 für die obere linke Ecke): 1,1

 X |   |  
---|---|---
   |   |  
---|---|---
   |   |  

Computer ist am Zug...

 X |   | O
---|---|---
   |   |  
---|---|---
   |   |  
```

---

## Prerequisites

- R (version ≥ 4.0) installed on your machine.

---

## Running the Script

1. Copy the code into an R script file (e.g., `tic_tac_toe.R`).
2. Run the script in an R environment:
   ```R
   source("tic_tac_toe.R")
   play_game()
   ```

---

## Customization

- **AI Difficulty**: Modify the `get_computer_input` function to improve or simplify the computer's decision-making process.
- **Symbols**: Change the symbols used for the player and computer (`X` and `O`) in the `play_game` function.

---

Enjoy your game! 🎮
