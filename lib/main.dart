import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  int win(board) {
    for (int i = 0; i <= 2; i++) {
      if (board[i] == [1, 1, 1]) {
        return 1;
      } else if (board[i] == [-1, -1, -1]) return -1;
    }
    return 0;
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
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey,
                  )
                ],
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
                              child: Icon(
                                (board[0][0] == 0)
                                    ? Icons.crop_square
                                    : (board[0][0] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[0][0] == 0) {
                                      if (player) {
                                        board[0][0] = 1;
                                      } else {
                                        board[0][0] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                (board[0][1] == 0)
                                    ? Icons.crop_square
                                    : (board[0][1] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[0][1] == 0) {
                                      if (player) {
                                        board[0][1] = 1;
                                      } else {
                                        board[0][1] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                (board[0][2] == 0)
                                    ? Icons.crop_square
                                    : (board[0][2] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[0][2] == 0) {
                                      if (player) {
                                        board[0][2] = 1;
                                      } else {
                                        board[0][2] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Icon(
                                (board[1][0] == 0)
                                    ? Icons.crop_square
                                    : (board[1][0] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[1][0] == 0) {
                                      if (player) {
                                        board[1][0] = 1;
                                      } else {
                                        board[1][0] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                (board[1][1] == 0)
                                    ? Icons.crop_square
                                    : (board[1][1] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[1][1] == 0) {
                                      if (player) {
                                        board[1][1] = 1;
                                      } else {
                                        board[1][1] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                (board[1][2] == 0)
                                    ? Icons.crop_square
                                    : (board[1][2] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[1][2] == 0) {
                                      if (player) {
                                        board[1][2] = 1;
                                      } else {
                                        board[1][2] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Icon(
                                (board[2][0] == 0)
                                    ? Icons.crop_square
                                    : (board[2][0] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[2][0] == 0) {
                                      if (player) {
                                        board[2][0] = 1;
                                      } else {
                                        board[2][0] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                (board[2][1] == 0)
                                    ? Icons.crop_square
                                    : (board[2][1] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[2][1] == 0) {
                                      if (player) {
                                        board[2][1] = 1;
                                      } else {
                                        board[2][1] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                (board[2][2] == 0)
                                    ? Icons.crop_square
                                    : (board[2][2] == 1)
                                        ? Icons.clear
                                        : Icons.panorama_fish_eye,
                                size: 80,
                              ),
                              onTap: () {
                                if (isGame) {
                                  setState(() {
                                    if (board[2][2] == 0) {
                                      if (player) {
                                        board[2][2] = 1;
                                      } else {
                                        board[2][2] = -1;
                                      }
                                      player = !player;
                                    }
                                    if (win(board) != 0) {
                                      isGame = false;
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(''),
                  ),
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
