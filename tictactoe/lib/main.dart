import 'package:flutter/material.dart';
import 'package:tictactoe/game_page.dart';
import 'package:tictactoe/snake_game.dart'; // Import your SnakeGamePage

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this line to false
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games Hub'),
        backgroundColor:
            Colors.black, // Set the AppBar background color to black
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: Size(200, 50),
                primary: Colors.black, // Set the button color to black
              ),
              child: Text(
                'Tic Tac Toe',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SnakeGame()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: Size(200, 50),
                primary: Colors.black, // Set the button color to black
              ),
              child: Text(
                'Snake Game',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
