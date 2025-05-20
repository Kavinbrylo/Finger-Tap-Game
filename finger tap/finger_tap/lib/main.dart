import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                color: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                height: 150,
                minWidth: 150,
                child: Text('START'),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                color: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                height: 150,
                minWidth: 150,
                child: Text('START'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  double BlueCardHeight = 0;
  double RedCardHeight = 0;

  int PlayerAScore = 0;
  int PlayerBScore = 0;

  bool initialized = false;
  @override
  Widget build(BuildContext context) {
      if (initialized == false) {
          BlueCardHeight= MediaQuery.of(context).size.height / 2;
          RedCardHeight= MediaQuery.of(context).size.height / 2;

          initialized = true;
      }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: (){
              setState(() {
                BlueCardHeight = BlueCardHeight + 30;
                RedCardHeight = RedCardHeight - 30;

                PlayerAScore++;
                PlayerBScore--;
                
              });

              double screenHeight = MediaQuery.of(context).size.height;
              double winningHeight = MediaQuery.of(context).size.height - 50;

              if(BlueCardHeight > winningHeight){
                // Show winning screen for player B
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       title: Text('Player A Wins!'),
                //       content: Text('Player A has reached the winning height.'),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           child: Text('OK'),
                //         ),
                //       ],
                //     );
                //   },
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(PlayerAScore,'A')),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.blueAccent,
              height:BlueCardHeight ,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'player A',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    PlayerAScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: (){
              setState(() {
                BlueCardHeight = BlueCardHeight - 30;
                RedCardHeight = RedCardHeight + 30;

                PlayerBScore++;
                PlayerAScore--;
                
              });
              double screenHeight = MediaQuery.of(context).size.height;
              double winningHeight = MediaQuery.of(context).size.height - 50;

              if(RedCardHeight > winningHeight){
                // Show winning screen for player B
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       title: Text('Player B Wins!'),
                //       content: Text('Player B has reached the winning height.'),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           child: Text('OK'),
                //         ),
                //       ],
                //     );
                //   },
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(PlayerBScore,'B')),
                );
              }

             
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.redAccent,
              height: RedCardHeight,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'player B',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    PlayerBScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ResultPage  extends StatelessWidget {

  int Score = 0;  
  String Winner = '';

  ResultPage(this.Score, this.Winner, {super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Winner == 'A' ? Colors.blueAccent : Colors.redAccent,
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Score.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
        Text(Winner == 'A' ? 'Player A Wins!' : 'Player B Wins!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        MaterialButton(onPressed: (){
          Navigator.pop(context);
          Navigator.pop(context);

        },
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          height: 150,
          minWidth: 150,
          child: Text('Play Again'),
        ),
      ],
    
    ),
  ),


);
}
}