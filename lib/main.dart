import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: mainpage(),
  ));
}

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 230, 85, 7),
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => gamepage()));
                },
                color: Colors.white24,
                height: 150,
                minWidth: 150,
                shape: const CircleBorder(),
                child: const Text(
                  "Start",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 210, 206, 206),
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => gamepage()));
                },
                color: Colors.white24,
                height: 150,
                minWidth: 150,
                shape: const CircleBorder(),
                child: const Text(
                  "Start",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class gamepage extends StatefulWidget {
  const gamepage({super.key});

  @override
  State<gamepage> createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  double orangech = 0;
  double greych = 0;

  bool intialized = false;

  int sca = 0;
  int scb = 0;

  @override
  Widget build(BuildContext context) {
    if (intialized == false) {
      orangech = MediaQuery.of(context).size.height / 2;
      greych = MediaQuery.of(context).size.height / 2;
      intialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                orangech += 30;
                greych -= 30;
                sca += 5;
              });

              double screenHeight = MediaQuery.of(context).size.height;
              double winHeight = screenHeight - 60;

              if (orangech > winHeight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => respage(sca, "Player A Won!")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: orangech,
              width: double.infinity,
              color: const Color.fromARGB(255, 230, 85, 7),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    sca.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                greych += 30;
                orangech -= 30;
                scb += 5;
              });

              double screenHeight = MediaQuery.of(context).size.height;

              if (greych > screenHeight - 60) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => respage(scb, "Player B Won !")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: greych,
              width: double.infinity,
              color: const Color.fromARGB(255, 210, 206, 206),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    scb.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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

class respage extends StatelessWidget {
  final int score;
  final String player;

  const respage(this.score, this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    // Set background color based on player
    Color bgColor;
    if (player == "Player A Won!") {
      bgColor = const Color.fromARGB(255, 230, 85, 7); 
    } else if (player == "Player B Won !") {
      bgColor = const Color.fromARGB(255, 210, 206, 206); 
    } else {
      bgColor = Colors.blueGrey;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SingleChildScrollView( // 👈 Prevents overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 60),
              ),
              Text(
                player,
                style: const TextStyle(
                    fontSize: 45, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context); // back to game
                  Navigator.pop(context); // back to main
                },
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: const Text("Restart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
