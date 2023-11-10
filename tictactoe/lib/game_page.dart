import 'package:flutter/material.dart';
import 'package:tictactoe/game_board.dart';
import 'package:tictactoe/ai_game_board.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool aiGame = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  aiGame = !aiGame;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text(
                aiGame ? 'Switch to PvP' : 'Switch to AI',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            if (aiGame) AIGameBoard() else GameBoard(),
          ],
        ),
      ),
    );
  }
}
