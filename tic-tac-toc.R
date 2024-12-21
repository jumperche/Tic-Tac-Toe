board <- matrix(0, nrow = 3, ncol = 3)

# Funktion, um das aktuelle Spielfeld anzuzeigen
print_board <- function(board) {
  cat("\n")
  for (i in 1:3) {
    cat(" ")
    for (j in 1:3) {
      if (board[i, j] == 1) {
        cat("X")
      } else if (board[i, j] == 2) {
        cat("O")
      } else {
        cat(" ")
      }
      if (j < 3) {
        cat(" | ")
      }
    }
    cat("\n")
    if (i < 3) {
      cat("---|---|---\n")
    }
  }
}

# Funktion, um den Spieler zu wählen, der beginnt
choose_player <- function() {
  player <- readline(prompt="Wollen Sie beginnen? (j/n)")
  if (tolower(player) == "j") {
    return(1)
  } else {
    return(2)
  }
}

# Funktion, um die Eingabe des Spielers zu erhalten
get_player_input <- function(board) {
  repeat {
    move <- readline(prompt="Geben Sie die Position für Ihren Zug ein (z.B. 1,1 für die obere linke Ecke): ")
    move <- as.numeric(strsplit(move, ",")[[1]])
    if (is.numeric(move) && length(move) == 2 && all(move %in% 1:3)) {
      if (board[move[1], move[2]] == 0) {
        return(move)
      } else {
        cat("\nDieser Zug ist ungültig. Bitte wählen Sie eine freie Position.\n")
      }
    } else {
      cat("\nUngültige Eingabe. Bitte geben Sie eine Position im Format 'x,y' ein.\n")
    }
  }
}

# Funktion, um den nächsten Zug des Computers zu berechnen
get_computer_input <- function(board, player) {
  opponent <- ifelse(player == 1, 2, 1)
  for (i in 1:3) {
    for (j in 1:3) {
      if (board[i, j] == 0) {
        new_board <- board
        new_board[i, j] <- player
        if (check_win(new_board, player)) {
          return(c(i, j))
        } else if (check_win(new_board, opponent)) {
          return(c(i, j))
        }
      }
    }
  }
  if (board[2, 2] == 0) {
    return(c(2, 2))
  }
  corners <- c(1, 3)
  random_corner <- sample(corners, 1)
  return(c(random_corner, random_corner))
}

check_win <- function(board, player) {
  if (any(rowSums(board == player) == 3)) {
    return(TRUE)
  } else if (any(colSums(board == player) == 3)) {
    return(TRUE)
  } else if (sum(diag(board == player)) == 3) {
    return(TRUE)
  } else if (sum(diag(board[3:1, ] == player)) == 3) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

play_game <- function() {
  # Initialisierung des Spielfelds
  board <- matrix(".", nrow = 3, ncol = 3, byrow = TRUE)
  
  # Spieler- und Computer-Symbole
  player <- "X"
  computer <- "O"
  
  # Schleife für die einzelnen Spielzüge
  for (i in 1:9) {
    # Spielerzug
    if (i %% 2 != 0) {
      repeat {
        cat("Gib die Koordinaten für deinen Zug ein (z.B. 1 2): ")
        move <- readline()
        coords <- as.numeric(strsplit(move, " ")[[1]])
        if (length(coords) != 2 || any(coords < 1) || any(coords > 3) ||
            board[coords[1], coords[2]] != ".") {
          cat("Ungültiger Zug! Bitte versuche es erneut.\n")
        } else {
          break
        }
      }
      board[coords[1], coords[2]] <- player
      cat("\nSpielfeld nach deinem Zug:\n")
      print(board)
      if (check_win(board, player)) {
        cat("\nHerzlichen Glückwunsch, du hast gewonnen!\n")
        return()
      }
      # Computerzug
    } else {
      cat("\nComputer ist am Zug...\n")
      # Überprüfung der möglichen Züge
      possible_moves <- which(board == ".")
      if (length(possible_moves) == 0) {
        cat("\nDas Spiel endet unentschieden.\n")
        return()
      }
      # Auswahl eines Zugs
      move <- possible_moves[sample(length(possible_moves), 1)]
      row <- as.integer((move - 1) / 3) + 1
      col <- move %% 3
      if (col == 0) col <- 3
      board[row, col] <- computer
      cat("\nSpielfeld nach dem Zug des Computers:\n")
      print(board)
      if (check_win(board, computer)) {
        cat("\nSchade, der Computer hat gewonnen.\n")
        return()
      }
    }
  }
  cat("\nDas Spiel endet unentschieden.\n")
}

play_game()
  # Initialisierung des Spielfelds
  board <- matrix
  
  