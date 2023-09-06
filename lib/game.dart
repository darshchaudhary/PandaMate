import 'package:flutter/material.dart';
import 'package:pandamate/dashboard.dart';

void main() {
  runApp(TicTacToeGame());
}

class TicTacToeGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTacToeBoard(),
    );
  }
}

class TicTacToeBoard extends StatefulWidget {
  @override
  _TicTacToeBoardState createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  late List<List<String>> board;
  bool isPlayerX = true; // true for Player X, false for Player O
  String currentPlayer = 'X';
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    board = List.generate(3, (_) => List.filled(3, ''));
  }

  void makeMove(int row, int col) {
    if (!gameOver && board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        checkWin(row, col);
        currentPlayer = isPlayerX ? 'O' : 'X';
        isPlayerX = !isPlayerX;
      });
    }
  }

  void checkWin(int row, int col) {
    // Check rows, columns, and diagonals for a win
    if (checkRow(row) || checkColumn(col) || checkDiagonals(row, col)) {
      setState(() {
        gameOver = true;
      });
    }
  }

  bool checkRow(int row) {
    return board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0].isNotEmpty;
  }

  bool checkColumn(int col) {
    return board[0][col] == board[1][col] && board[1][col] == board[2][col] && board[0][col].isNotEmpty;
  }

  bool checkDiagonals(int row, int col) {
    if (row == col) {
      // Check the main diagonal
      return board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0].isNotEmpty;
    } else if (row + col == 2) {
      // Check the secondary diagonal
      return board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2].isNotEmpty;
    }
    return false;
  }

  void resetGame() {
    setState(() {
      initializeBoard();
      currentPlayer = 'X';
      isPlayerX = true;
      gameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7091A4),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        title: Text('Tic-Tac-Toe'),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            gameOver ? 'Player $currentPlayer lost!' : 'Player $currentPlayer\'s turn',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final row = index ~/ 3;
              final col = index % 3;
              return GestureDetector(
                onTap: () => makeMove(row, col),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      board[row][col],
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              );
            },
            itemCount: 9,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 75,
            width: 175,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
              ),
              onPressed: resetGame,
              child: Text(
                  'Restart Game',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
