import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oh = true;
  List xo = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int ohScore = 0;
  int exScore = 0;
  int filledBox = 0;
  var myTextStyle = const TextStyle(
      fontSize: 20, color: Colors.white, fontFamily: 'PressStart');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              PlayerSection(
                myTextStyle: myTextStyle.copyWith(color: Color(0xff90bb885)),
                score: exScore,
                player: 'Player X',
              ),
              PlayerSection(
                  myTextStyle: myTextStyle.copyWith(color: Colors.red),
                  score: ohScore,
                  player: 'Player O')
            ]),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    tapped(index);
                  },
                  child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Text(xo[index],
                              style: TextStyle(
                                  color: xo[index] == 'X'
                                      ? Color(0xff90bb885)
                                      : Colors.red,
                                  fontSize: 30,
                                  fontFamily: 'PressStart')))),
                );
              },
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('TIC TAC TOE',
                    style: myTextStyle.copyWith(color: Color(0xff90bb885))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34.0),
                child: Text('@CREATEDBYDEMON',
                    style: myTextStyle.copyWith(color: Colors.red)),
              )
            ],
          )),
        ],
      ),
    );
  }

  tapped(index) {
    setState(() {
      if (oh && xo[index] == '') {
        filledBox++;
        xo[index] = 'X';
      } else if (!oh && xo[index] == '') {
        filledBox++;
        xo[index] = 'O';
      }
      oh = !oh;
      checkwinner();
    });
  }

  checkwinner() {
    if (xo[0] == xo[1] && xo[0] == xo[2] && xo[0] != '') {
      showWinDialog(xo[0]);
    }
    if (xo[0] == xo[3] && xo[0] == xo[6] && xo[0] != '') {
      showWinDialog(xo[0]);
    }
    if (xo[0] == xo[4] && xo[0] == xo[8] && xo[0] != '') {
      showWinDialog(xo[0]);
    }
    if (xo[1] == xo[4] && xo[1] == xo[7] && xo[1] != '') {
      showWinDialog(xo[1]);
    }
    if (xo[2] == xo[5] && xo[2] == xo[8] && xo[2] != '') {
      showWinDialog(xo[2]);
    }
    if (xo[2] == xo[4] && xo[2] == xo[6] && xo[2] != '') {
      showWinDialog(xo[2]);
    }
    if (xo[3] == xo[4] && xo[3] == xo[5] && xo[3] != '') {
      showWinDialog(xo[3]);
    }
    if (xo[6] == xo[7] && xo[6] == xo[8] && xo[6] != '') {
      showWinDialog(xo[6]);
    } else if (filledBox == 9) {
      showDrawDialog();
    }
  }

  showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            title: const Text('Draw',
                style: const TextStyle(
                    fontFamily: 'PressStart', color: Colors.white)),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20)),
                  onPressed: () {
                    clearBoard();
                    Navigator.pop(context);
                  },
                  child: const Text('Play Again!',
                      style: const TextStyle(
                          fontFamily: 'PressStart', color: Colors.white)))
            ],
          );
        });
  }

  showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            title: Text('Winner!  ' + winner,
                style: const TextStyle(
                    fontFamily: 'PressStart', color: Colors.white)),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20)),
                  onPressed: () {
                    clearBoard();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Play Again!',
                    style: TextStyle(fontFamily: 'PressStart'),
                  ))
            ],
          );
        });

    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == "X") {
      exScore += 1;
    }
  }

  clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        xo[i] = '';
      }
    });
    filledBox = 0;
  }
}

class PlayerSection extends StatelessWidget {
  const PlayerSection({
    Key? key,
    required this.myTextStyle,
    required this.score,
    required this.player,
  }) : super(key: key);

  final TextStyle myTextStyle;
  final int score;
  final String player;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(player, style: myTextStyle),
          const SizedBox(height: 28),
          Text(score.toString(), style: myTextStyle)
        ],
      ),
    );
  }
}
