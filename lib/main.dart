import 'package:flutter/material.dart';
import 'package:sudoku/board.dart';
import 'package:sudoku/solution.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '数独'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<List<int?>> sukodu;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    sukodu = List.generate(9, (index) {
      return List.generate(9, (index) => null);
    });
  }

  void problem() {
    reset();
    setState(() {
      sukodu[0][2] = 9;
      sukodu[0][4] = 1;
      sukodu[0][6] = 7;

      sukodu[1][1] = 7;
      sukodu[1][6] = 1;
      sukodu[1][7] = 9;

      sukodu[2][0] = 1;
      sukodu[2][1] = 2;
      sukodu[2][2] = 6;
      sukodu[2][5] = 3;
      sukodu[2][6] = 5;
      sukodu[2][8] = 8;

      sukodu[3][2] = 4;
      sukodu[3][3] = 9;
      sukodu[3][5] = 8;

      sukodu[4][0] = 8;
      sukodu[4][8] = 4;

      sukodu[5][3] = 1;
      sukodu[5][5] = 5;
      sukodu[5][6] = 8;

      sukodu[6][0] = 5;
      sukodu[6][2] = 1;
      sukodu[6][3] = 4;
      sukodu[6][6] = 2;
      sukodu[6][7] = 8;
      sukodu[6][8] = 7;

      sukodu[7][1] = 4;
      sukodu[7][2] = 3;
      sukodu[7][7] = 5;

      sukodu[8][2] = 2;
      sukodu[8][4] = 5;
      sukodu[8][6] = 4;
    });
  }

  void answer() {
    setState(() {
      Solution(sukodu).solve();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Board(
            sukodu: sukodu,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    reset();
                  });
                },
                child: const Text(
                  'Reset',
                ),
              ),
              ElevatedButton(
                onPressed: problem,
                child: const Text(
                  'Problem',
                ),
              ),
              ElevatedButton(
                onPressed: answer,
                child: const Text(
                  'Answer',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
