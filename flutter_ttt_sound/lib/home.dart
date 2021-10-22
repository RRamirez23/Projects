import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
enum Difficulty{EASY, MEDIUM, HARD}

class HomePageState extends State<HomePage> {
//constant characters for each player
  static const String HUMAN_PLAYER = "X";
  static const String COMPUTER_PLAYER = "O";
  static const String MESSAGE = 'This is a simple tic-tac-toe game for Android and iOS.The buttons represent the game board and a text   widget displays the game status. Moves are represented by an X for the human player and an O for the computer';

//constant for board size
  static const BOARD_SIZE = 9;

  //Game Variables
  static var humanScore = 0;
  static var computerScore = 0;
  static var tieScore = 0;

  static AudioCache swish = new AudioCache();
  static AudioCache sword = new AudioCache();

  var gameOver = false;
  var win = 0;
  var turn = 0;
  var _mBoard = [" "," "," "," "," "," "," "," "," "];
  var rnd = new Random(BOARD_SIZE);
  var _text = "New Game, X's Turn";
  var _gameDifficulty = 1;

  playlocal_sound1(){
    swish.play('swish.mp3');
  }
  playlocal_sound2(){
    sword.play('sword.mp3');
  }

  Future _settings() async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: new Text('Select the Difficulty Level'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('Easy'),
              onPressed: () {
                Navigator.pop(context, Difficulty.EASY);
              },
            ),
            new SimpleDialogOption(
              child: new Text('Medium'),
              onPressed: () {
                Navigator.pop(context, Difficulty.MEDIUM);

              },
            ),
            new SimpleDialogOption(
              child: new Text('Hard'),
              onPressed: () {
                Navigator.pop(context, Difficulty.HARD);

              },
            ),
          ],
        );
      },
    )) {
      case Difficulty.EASY:
        _gameDifficulty = 1;
        final snackBar = SnackBar(
          content: Text('Game Set to: Easy'),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      case Difficulty.MEDIUM:
        _gameDifficulty = 2;
        final snackBar = SnackBar(
          content: Text('Game Set to: Medium'),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {

            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      case Difficulty.HARD:
        _gameDifficulty = 3;
        final snackBar = SnackBar(
          content: Text('Game Set to: Hard'),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {

            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;}
    print('The selection was Choice = ' + '$_gameDifficulty');
  }


  void _aboutDialog() {
    showAboutDialog(
      context: context,
      applicationIcon: Image.asset(
        'assets/tictac.PNG',
        height: 50,
        width: 50,
      ),
      applicationName: 'Tic Tac Toe',
      applicationVersion: '0.0.1',
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 15), child: Text(MESSAGE))
      ],
    );

  }

   getWinningMove(){
    for (var i = 0; i < BOARD_SIZE; i++) {
      if (_mBoard[i] != HUMAN_PLAYER && _mBoard[i] != COMPUTER_PLAYER) {
        var curr = _mBoard[i];
        _mBoard[i] = COMPUTER_PLAYER;
        if (checkForWinner() == 3) {
          print("Computer is making a winning move to " + (i + 1).toString());

          return true;
        }
        else
          _mBoard[i] = curr;
      }
    }
    return false;
  }
   getBlockingMove(){
    for (int i = 0; i < BOARD_SIZE; i++) {
      if (_mBoard[i] != HUMAN_PLAYER && _mBoard[i] != COMPUTER_PLAYER) {
        var curr = _mBoard[i];
        _mBoard[i] = HUMAN_PLAYER;
        if (checkForWinner() == 2) {
          _mBoard[i] = COMPUTER_PLAYER;
          print("Computer is making a blocking moving to " + (i + 1).toString());
          return true;
        }
        else
          _mBoard[i] = curr;
      }
    }
    return false;
  }
  void getRandomMove(){
    var move;
   do {
      move = rnd.nextInt(BOARD_SIZE);
    } while (_mBoard[move] == HUMAN_PLAYER ||
        _mBoard[move] == COMPUTER_PLAYER);

    print("Computer is making a random move to " + (move + 1).toString());

    _mBoard[move] = COMPUTER_PLAYER;
  }

  void _runDelayedCode(){ //Replaced get computer move, same thing but with a future
    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
      var madeWinningMove = false;
      var madeBlockingMove = false;
      if(_gameDifficulty == 3) {
        madeWinningMove = getWinningMove();
      }
      if((_gameDifficulty == 3 || _gameDifficulty == 2) && !madeWinningMove){
        madeBlockingMove = getBlockingMove();
      }
      if(!madeWinningMove && !madeBlockingMove){
       getRandomMove();
      }

    }


    );
      playlocal_sound2();
      win = checkForWinner();
      showStatus(win);

    });

  }



  void displayBoard(){
    print("");
    print(_mBoard[0] + " | " + _mBoard[1] + " | " + _mBoard[2]);
    print("-----------");
    print(_mBoard[3] + " | " + _mBoard[4] + " | " + _mBoard[5]);
    print("-----------");
    print(_mBoard[6] + " | " + _mBoard[7] + " | " + _mBoard[8]);
    print("");
  }

  int checkForWinner(){
    for (var i = 0; i <= 6; i += 3) {
      if (_mBoard[i] == (HUMAN_PLAYER) &&
          _mBoard[i + 1] == (HUMAN_PLAYER) &&
          _mBoard[i + 2] == (HUMAN_PLAYER))
      {

        return 2;
      }

      if (_mBoard[i] == (COMPUTER_PLAYER) &&
          _mBoard[i + 1] == (COMPUTER_PLAYER) &&
          _mBoard[i + 2] == (COMPUTER_PLAYER))
      {

        return 3;
      }
    }

    // Check vertical wins
    for (var i = 0; i <= 2; i++) {
      if (_mBoard[i] == (HUMAN_PLAYER) &&
          _mBoard[i + 3] == (HUMAN_PLAYER) &&
          _mBoard[i + 6] == (HUMAN_PLAYER))
      {

        return 2;
      }

      if (_mBoard[i] == (COMPUTER_PLAYER) &&
          _mBoard[i + 3] == (COMPUTER_PLAYER) &&
          _mBoard[i + 6] == (COMPUTER_PLAYER))
      {

        return 3;
      }
    }

    // Check for diagonal wins
    if ((_mBoard[0] == (HUMAN_PLAYER) &&
        _mBoard[4] == (HUMAN_PLAYER) &&
        _mBoard[8] == (HUMAN_PLAYER)) ||
        (_mBoard[2] == (HUMAN_PLAYER) &&
            _mBoard[4] == (HUMAN_PLAYER) &&
            _mBoard[6] == (HUMAN_PLAYER)))
    {

      return 2;
    }

    if ((_mBoard[0] == (COMPUTER_PLAYER) &&
        _mBoard[4] == (COMPUTER_PLAYER) &&
        _mBoard[8] == (COMPUTER_PLAYER)) ||
        (_mBoard[2] == (COMPUTER_PLAYER) &&
            _mBoard[4] == (COMPUTER_PLAYER) &&
            _mBoard[6] == (COMPUTER_PLAYER)))
    {

      return 3;
    }

    for (var i = 0; i < BOARD_SIZE; i++) {
      // If we find a number, then no one has won yet
      if (!(_mBoard[i] == (HUMAN_PLAYER)) && !(_mBoard[i] == (COMPUTER_PLAYER)))
        return 0;
    }

    // If we make it through the previous loop, all places are taken, so it's a tie*/

    return 1;
  }

  void displayMessage(String text){
    setState(() {
      _text = text;
      print(_text);
    });
  }


  void showStatus(int win) {
    if (win == 1) {
      gameOver = true;
      tieScore++;
      displayMessage("It's a tie.");
    } else if (win == 2) {
      gameOver = true;
      humanScore++;
      displayMessage(HUMAN_PLAYER + " wins!");
    } else if (win == 3) {
      gameOver = true;
      computerScore++;
      displayMessage(COMPUTER_PLAYER + " wins!");
    }
  }

  void _button0() {

    setState(() {
 if (_mBoard[0] == HUMAN_PLAYER || _mBoard[0] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[0] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #0 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }

  void _button1() {
    setState(() {

      if (_mBoard[1] == HUMAN_PLAYER || _mBoard[1] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[1] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #1 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }

  void _button2() {
    setState(() {

      if (_mBoard[2] == HUMAN_PLAYER || _mBoard[2] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[2] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #2 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }
  void _button3() {
    setState(() {

      if (_mBoard[3] == HUMAN_PLAYER || _mBoard[3] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[3] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #3 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }
  void _button4() {
    setState(() {

      if (_mBoard[4] == HUMAN_PLAYER || _mBoard[4] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[4] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #4 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }
  void _button5() {
    setState(() {

      if (_mBoard[5] == HUMAN_PLAYER || _mBoard[5] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[5] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #5 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }
  void _button6() {
    setState(() {

      if (_mBoard[6] == HUMAN_PLAYER || _mBoard[6] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[6] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #6 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }
  void _button7() {
    setState(() {

      if (_mBoard[7] == HUMAN_PLAYER || _mBoard[7] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[7] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #7 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }
  void _button8() {
    setState(() {

      if (_mBoard[8] == HUMAN_PLAYER || _mBoard[8] == COMPUTER_PLAYER) {
        print("That space is occupied.  Please choose another space.");
        return;
      } else if (win == 0) {
        if (turn == 0) {
          _mBoard[8] = HUMAN_PLAYER;
          _text = HUMAN_PLAYER + " MOVED, O's TURN";
          print("onTap called. card #8 was pressed");
          turn = 1;
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
        if ((turn == 1) && (win == 0)){
          turn = 0;
          _runDelayedCode();
          win = checkForWinner();
          showStatus(win);
          displayBoard();
        }
      }
    });
    playlocal_sound1();
  }

  void resetBoard(){
    gameOver = false;
    win = 0;
    turn = 0;
    rnd = new Random(BOARD_SIZE);
    setState(() {
      _mBoard = [" "," "," "," "," "," "," "," "," "];
      _text = "New Game, X's Turn";
    });
    displayBoard();
  }

  void resetScores(){
    setState(() {
      humanScore = 0;
      computerScore = 0;
      tieScore = 0;
    });
  }



  Widget _buildVerticalLayout(){
    return Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button0,
                  child: Text(_mBoard[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button1,
                  child: Text(_mBoard[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button2,
                  child: Text(_mBoard[2],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),

              ),
            ],
          ),//end of row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button3,
                  child: Text(_mBoard[3],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button4,
                  child: Text(_mBoard[4],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button5,
                  child: Text(_mBoard[5],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ],
          ),//end of row2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button6,
                  child: Text(_mBoard[6],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button7,
                  child: Text(_mBoard[7],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _button8,
                  child: Text(_mBoard[8],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ],
          ),//end of row3
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 300.0,
                margin: EdgeInsets.all(10.0),
                child: Text(_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'
                  ),
                ),
              )
            ],
          ),//end of row4
          Row(
            /*
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 40.0,
                width: 200.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: resetBoard,
                  child: Text('Reset App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'
                    ),
                  ),
                ),
              )
            ],*/

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Human"),
                  Text("Computer"),
                  Text("Ties")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(humanScore.toString()),
                  Text(computerScore.toString()),
                  Text(tieScore.toString())
                ],
              )
            ],
          )//end of row 5

        ],
      ),
    );
  }

  Widget _buildHorizontalLayout(){
    var horizontalHeight = MediaQuery.of(context).size.height * .2;
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button0,
                        child: Text(_mBoard[0],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button1,
                        child: Text(_mBoard[1],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button2,
                        child: Text(_mBoard[2],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),

                    ),
                  ],
                ),//end of row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button3,
                        child: Text(_mBoard[3],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button4,
                        child: Text(_mBoard[4],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button5,
                        child: Text(_mBoard[5],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),//end of row2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button6,
                        child: Text(_mBoard[6],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height:horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button7,
                        child: Text(_mBoard[7],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: horizontalHeight,
                      width: horizontalHeight,
                      margin: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: _button8,
                        child: Text(_mBoard[8],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),//end of row3
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 300.0,
                      margin: EdgeInsets.all(10.0),
                      child: Text(_text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Human",),
                        Text("Computer"),
                        Text("Ties")
                      ],
                    ),
                    Container(
                      width: horizontalHeight,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(humanScore.toString()),
                        Text(computerScore.toString()),
                        Text(tieScore.toString())
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text('Tic Tac Toe'),
          leading: IconButton(icon: Icon(Icons.border_all), onPressed: null)
          ,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.new_releases), onPressed: resetBoard, tooltip: 'New Game',),
            IconButton(icon: Icon(Icons.refresh), onPressed: resetScores, tooltip: 'Reset Scores',),
            IconButton(icon: Icon(Icons.close), onPressed: () => exit(0), tooltip: 'Quit Game',),
            PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: _aboutDialog,
                      child: Text(
                      'About',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: _settings,
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ]
            )
          ],
        ),
        body: OrientationBuilder(
          builder: (context, orientation){
            return orientation == Orientation.portrait
                ?
            _buildVerticalLayout()

                :
            _buildHorizontalLayout();
          },
        )
    );
  }
}