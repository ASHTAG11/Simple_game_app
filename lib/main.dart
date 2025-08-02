import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const SettingsContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "FingerLinger",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 230, 85, 7),
              width: double.infinity,
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GamePage()));
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
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 210, 206, 206),
              width: double.infinity,
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GamePage()));
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
          ),
        ],
      ),
    );
  }
}

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Settings Page",
        style: TextStyle(fontSize: 24),
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
  double orangech = 0;
  double greych = 0;
  bool initialized = false;
  int sca = 0;
  int scb = 0;

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      orangech = MediaQuery.of(context).size.height / 2;
      greych = MediaQuery.of(context).size.height / 2;
      initialized = true;
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
                        builder: (context) =>
                            ResultPage(sca, "Player A Won!")));
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
                        builder: (context) =>
                            ResultPage(scb, "Player B Won !")));
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

class ResultPage extends StatelessWidget {
  final int score;
  final String player;

  const ResultPage(this.score, this.player, {super.key});

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
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
                  Navigator.pop(context);
                  Navigator.pop(context);
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
