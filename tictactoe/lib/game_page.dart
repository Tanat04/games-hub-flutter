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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tic Tac Toe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  aiGame = !aiGame;
                });
              },
              child: Text(aiGame ? 'Switch to PvP' : 'Switch to AI'),
            ),
            SizedBox(height: 20),
            if (aiGame) AIGameBoard() else GameBoard(),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:tictactoe/ai_game_board.dart';
// import 'package:tictactoe/game_board.dart';
// import 'package:tictactoe/main.dart';
// import 'auth.dart';

// class GamePage extends StatefulWidget {
//   const GamePage({Key? key}) : super(key: key);

//   @override
//   _GamePageState createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   bool aiGame = false;

//   void _logout() async {
//     await Auth().signOut(context); // Pass the context here
//     // Navigate to the login screen or any other screen you want after logout
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const AuthScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tic Tac Toe'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(aiGame ? Icons.person : Icons.computer),
//             onPressed: () {
//               setState(() {
//                 aiGame = !aiGame;
//               });
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//       ),
//       body: aiGame ? const AIGameBoard() : const GameBoard(),
//     );
//   }
// }
