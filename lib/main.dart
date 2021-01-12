import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TicTac(),
    );
  }
}

class TicTac extends StatefulWidget {
  @override
  _TicTacState createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  // vars
  bool isGame = false;
  bool player = true; // false player 2 -- true player 1
  //
  List board = [];
  String finish = '';

  int win(board) {
    for (int i = 0; i <= 2; i++) {
      if (listEquals(board[i], [1, 1, 1])) {
        return 1;
      } else if (listEquals(board[i], [-1, -1, -1])) return -1;
      if (listEquals(
          [board[i % 3][i], board[(i + 1) % 3][i], board[(i + 2) % 3][i]],
          [1, 1, 1])) {
        return 1;
      } else if (listEquals(
          [board[i % 3][i], board[(i + 1) % 3][i], board[(i + 2) % 3][i]],
          [-1, -1, -1])) {
        return -1;
      }
    }
    if (listEquals([board[0][0], board[1][1], board[2][2]], [1, 1, 1]) ||
        listEquals([board[0][2], board[1][1], board[2][0]], [1, 1, 1])) {
      return 1;
    } else if (listEquals(
            [board[0][0], board[1][1], board[2][2]], [-1, -1, -1]) ||
        listEquals([board[0][2], board[1][1], board[2][0]], [-1, -1, -1])) {
      return -1;
    }

    return 0;
  }

  void winModif() {
    print(board);
    setState(() {
      if (win(board) != 0) {
        isGame = false;
        (win(board) == 1) ? finish = 'Player 1 won' : finish = 'Player 2 won';
      }
    });
  }

  Widget iconCustom(cell) {
    return Icon(
      (cell == 0)
          ? Icons.crop_square
          : (cell == 1) ? Icons.clear : Icons.panorama_fish_eye,
      size: 80,
    );
  }

  void play(a, b) {
    if (isGame) {
      setState(() {
        if (board[a][b] == 0) {
          if (player) {
            board[a][b] = 1;
          } else {
            board[a][b] = -1;
          }
          player = !player;
        }
      });
      winModif();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      board = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0],
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'Tic Tac Toe',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
                boxShadow: [BoxShadow(blurRadius: 20, color: Colors.grey)],
              ),
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: iconCustom(board[0][0]),
                              onTap: () => play(0, 0),
                            ),
                            GestureDetector(
                              child: iconCustom(board[0][1]),
                              onTap: () => play(0, 1),
                            ),
                            GestureDetector(
                              child: iconCustom(board[0][2]),
                              onTap: () => play(0, 2),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: iconCustom(board[1][0]),
                              onTap: () => play(1, 0),
                            ),
                            GestureDetector(
                              child: iconCustom(board[1][1]),
                              onTap: () => play(1, 1),
                            ),
                            GestureDetector(
                              child: iconCustom(board[1][2]),
                              onTap: () => play(1, 2),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: iconCustom(board[2][0]),
                              onTap: () => play(2, 0),
                            ),
                            GestureDetector(
                              child: iconCustom(board[2][1]),
                              onTap: () => play(2, 1),
                            ),
                            GestureDetector(
                              child: iconCustom(board[2][2]),
                              onTap: () => play(2, 2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(child: Text(finish)),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 100,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text('Start'),
                        onPressed: () {
                          setState(() {
                            isGame = true;
                          });
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text('Reset'),
                        onPressed: () {
                          setState(() {
                            finish = '';
                            isGame = false;
                            player = true;
                            board = [
                              [0, 0, 0],
                              [0, 0, 0],
                              [0, 0, 0],
                            ];
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
