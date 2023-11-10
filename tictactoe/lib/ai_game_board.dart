// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';

// class AIGameBoard extends StatefulWidget {
//   const AIGameBoard({Key? key}) : super(key: key);

//   @override
//   _AIGameBoardState createState() => _AIGameBoardState();
// }

// class _AIGameBoardState extends State<AIGameBoard> {
//   List<List<String>> matrix = List.generate(3, (_) => List.filled(3, ''));
//   String currentPlayer = 'X';
//   int scoreX = 0;
//   int scoreO = 0;

//   void _handleTap(int i, int j) {
//     if (matrix[i][j] == '' && currentPlayer == 'X') {
//       setState(() {
//         matrix[i][j] = currentPlayer;
//         if (_checkWinner(i, j)) {
//           _handleWinner(currentPlayer);
//         } else {
//           _aiMove();
//         }
//       });
//     }
//   }

//   void _aiMove() {
//     // AI will block the player if they are about to win, or take the winning move if available
//     for (int i = 0; i < 3; i++) {
//       for (int j = 0; j < 3; j++) {
//         if (matrix[i][j] == '') {
//           matrix[i][j] = 'O';
//           if (_checkWinner(i, j)) {
//             _handleWinner('O');
//             return;
//           }
//           matrix[i][j] = 'X';
//           if (_checkWinner(i, j)) {
//             matrix[i][j] = 'O';
//             return;
//           }
//           matrix[i][j] = '';
//         }
//       }
//     }

//     // If no block or winning move, take the center spot
//     if (matrix[1][1] == '') {
//       matrix[1][1] = 'O';
//       if (_checkWinner(1, 1)) {
//         _handleWinner('O');
//       }
//     } else {
//       // If no block, winning move, or center spot, take a random spot
//       while (true) {
//         var rng = new Random();
//         int i = rng.nextInt(3);
//         int j = rng.nextInt(3);
//         if (matrix[i][j] == '') {
//           matrix[i][j] = 'O';
//           if (_checkWinner(i, j)) {
//             _handleWinner('O');
//           }
//           break;
//         }
//       }
//     }
//   }

//   bool _checkWinner(int i, int j) {
//     var player = matrix[i][j];

//     // Check row
//     for (int col = 0; col < 3; col++) {
//       if (matrix[i][col] != player) {
//         break;
//       }
//       if (col == 2) {
//         return true;
//       }
//     }

//     // Check column
//     for (int row = 0; row < 3; row++) {
//       if (matrix[row][j] != player) {
//         break;
//       }
//       if (row == 2) {
//         return true;
//       }
//     }

//     // Check diagonal
//     if (i == j) {
//       for (int diag = 0; diag < 3; diag++) {
//         if (matrix[diag][diag] != player) {
//           break;
//         }
//         if (diag == 2) {
//           return true;
//         }
//       }
//     }

//     // Check anti-diagonal
//     if (i + j == 2) {
//       for (int diag = 0; diag < 3; diag++) {
//         if (matrix[diag][2 - diag] != player) {
//           break;
//         }
//         if (diag == 2) {
//           return true;
//         }
//       }
//     }

//     return false;
//   }

//   void _handleWinner(String player) {
//     if (player == 'X') {
//       scoreX++;
//     } else if (player == 'O') {
//       scoreO++;
//     }
//     _showResult(player);
//     _resetGame();
//   }

//   void _showResult(String winner) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Game Over'),
//           content: Text(winner == 'Draw' ? 'It\'s a Draw!' : 'Player $winner wins!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Play Again'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _resetGame() {
//     setState(() {
//       matrix = List.generate(3, (_) => List.filled(3, ''));
//       currentPlayer = 'X';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Score: X - $scoreX : O - $scoreO'),
//         GridView.builder(
//           shrinkWrap: true,
//           itemCount: 9,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//           ),
//           itemBuilder: (context, index) {
//             int i = index ~/ 3;
//             int j = index % 3;
//             return GestureDetector(
//               onTap: () => _handleTap(i, j),
//               child: GridTile(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: Center(
//                     child: Text(
//                       matrix[i][j],
//                       style: const TextStyle(fontSize: 24),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AIGameBoard extends StatefulWidget {
  const AIGameBoard({Key? key}) : super(key: key);

  @override
  _AIGameBoardState createState() => _AIGameBoardState();
}

class _AIGameBoardState extends State<AIGameBoard> {
  List<List<String>> matrix = List.generate(3, (_) => List.filled(3, ''));
  String currentPlayer = 'X';
  int scoreX = 0;
  int scoreO = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Score:Player [X] - $scoreX :AI [O] - $scoreO'),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            int i = index ~/ 3;
            int j = index % 3;
            return GestureDetector(
              onTap: () => _handleTap(i, j),
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      matrix[i][j],
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _handleTap(int i, int j) {
    if (matrix[i][j] == '' && currentPlayer == 'X' && !_isBoardFull()) {
      setState(() {
        matrix[i][j] = currentPlayer;
        if (_checkWinner(i, j)) {
          _handleWinner(currentPlayer);
        } else if (_isBoardFull()) {
          _showResult('Draw');
        } else {
          _aiMove();
        }
      });
    }
  }

  bool _checkWinner(int i, int j) {
    var player = matrix[i][j];

    // Check row
    for (int col = 0; col < 3; col++) {
      if (matrix[i][col] != player) {
        break;
      }
      if (col == 2) {
        return true;
      }
    }

    // Check column
    for (int row = 0; row < 3; row++) {
      if (matrix[row][j] != player) {
        break;
      }
      if (row == 2) {
        return true;
      }
    }

    // Check diagonal
    if (i == j) {
      for (int diag = 0; diag < 3; diag++) {
        if (matrix[diag][diag] != player) {
          break;
        }
        if (diag == 2) {
          return true;
        }
      }
    }

    // Check anti-diagonal
    if (i + j == 2) {
      for (int diag = 0; diag < 3; diag++) {
        if (matrix[diag][2 - diag] != player) {
          break;
        }
        if (diag == 2) {
          return true;
        }
      }
    }

    return false;
  }

  void _handleWinner(String player) {
    if (player == 'X') {
      scoreX++;
    } else if (player == 'O') {
      scoreO++;
    }
    _showResult(player);
    _resetGame();
  }

  void _showResult(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content:
              Text(winner == 'Draw' ? 'It\'s a Draw!' : 'Player $winner wins!'),
          actions: [
            TextButton(
              onPressed: () {
                _resetGame(); // Reset the game when "Play Again" is pressed
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  bool _isBoardFull() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (matrix[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  // void _aiMove() {
  //   // AI will block the player if they are about to win, or take the winning move if available
  //   for (int i = 0; i < 3; i++) {
  //     for (int j = 0; j < 3; j++) {
  //       if (matrix[i][j] == '') {
  //         matrix[i][j] = 'O';
  //         if (_checkWinner(i, j)) {
  //           _handleWinner('O');
  //           return;
  //         }
  //         matrix[i][j] = 'X';
  //         if (_checkWinner(i, j)) {
  //           matrix[i][j] = 'O';
  //           return;
  //         }
  //         matrix[i][j] = '';
  //       }
  //     }
  //   }

  //   // If no block or winning move, take the center spot
  //   if (matrix[1][1] == '') {
  //     matrix[1][1] = 'O';
  //     if (_checkWinner(1, 1)) {
  //       _handleWinner('O');
  //     }
  //   } else {
  //     // If no block, winning move, or center spot, take a random spot
  //     while (true) {
  //       var rng = new Random();
  //       int i = rng.nextInt(3);
  //       int j = rng.nextInt(3);
  //       if (matrix[i][j] == '') {
  //         matrix[i][j] = 'O';
  //         if (_checkWinner(i, j)) {
  //           _handleWinner('O');
  //         }
  //         break;
  //       }
  //     }
  //   }
  // }
  // Add this method to the _AIGameBoardState class
int _evaluateBoard() {
  // Check rows, columns, and diagonals for a winner
  for (int i = 0; i < 3; i++) {
    // Check rows
    if (matrix[i][0] == matrix[i][1] && matrix[i][1] == matrix[i][2]) {
      if (matrix[i][0] == 'O') return 1;
      if (matrix[i][0] == 'X') return -1;
    }

    // Check columns
    if (matrix[0][i] == matrix[1][i] && matrix[1][i] == matrix[2][i]) {
      if (matrix[0][i] == 'O') return 1;
      if (matrix[0][i] == 'X') return -1;
    }
  }

  // Check diagonals
  if (matrix[0][0] == matrix[1][1] && matrix[1][1] == matrix[2][2]) {
    if (matrix[0][0] == 'O') return 1;
    if (matrix[0][0] == 'X') return -1;
  }

  if (matrix[0][2] == matrix[1][1] && matrix[1][1] == matrix[2][0]) {
    if (matrix[0][2] == 'O') return 1;
    if (matrix[0][2] == 'X') return -1;
  }

  // No winner, return 0
  return 0;
}

// Add this method to the _AIGameBoardState class
  int _alphaBetaPruning(int depth, int alpha, int beta, bool isMaximizing) {
    int score = _evaluateBoard();

    if (score == 1 || score == -1) {
      return score;
    }

    if (_isBoardFull()) {
      return 0;
    }

    if (isMaximizing) {
      int maxEval = -1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (matrix[i][j] == '') {
            matrix[i][j] = 'O';
            int eval = _alphaBetaPruning(depth + 1, alpha, beta, false);
            matrix[i][j] = '';
            maxEval = max(maxEval, eval);
            alpha = max(alpha, eval);
            if (beta <= alpha) {
              break;
            }
          }
        }
      }
      return maxEval;
    } else {
      int minEval = 1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (matrix[i][j] == '') {
            matrix[i][j] = 'X';
            int eval = _alphaBetaPruning(depth + 1, alpha, beta, true);
            matrix[i][j] = '';
            minEval = min(minEval, eval);
            beta = min(beta, eval);
            if (beta <= alpha) {
              break;
            }
          }
        }
      }
      return minEval;
    }
  }

// Modify the _aiMove method to use the alpha-beta pruning algorithm
  void _aiMove() {
    int bestScore = -1000;
    int bestMoveI = -1;
    int bestMoveJ = -1;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (matrix[i][j] == '') {
          matrix[i][j] = 'O';
          int moveScore = _alphaBetaPruning(0, -1000, 1000, false);
          matrix[i][j] = '';

          if (moveScore > bestScore) {
            bestScore = moveScore;
            bestMoveI = i;
            bestMoveJ = j;
          }
        }
      }
    }

    matrix[bestMoveI][bestMoveJ] = 'O';
    if (_checkWinner(bestMoveI, bestMoveJ)) {
      _handleWinner('O');
    } else if (_isBoardFull()) {
      _showResult('Draw');
    }
  }

  void _resetGame() {
    setState(() {
      matrix = List.generate(3, (_) => List.filled(3, ''));
      currentPlayer = 'X';
    });
  }
}
