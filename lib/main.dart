import 'package:flutter/material.dart';
import 'package:sudoku/board.dart';
import 'package:sudoku/problem.dart';
import 'package:sudoku/solution.dart';
import 'package:sudoku/square.dart';

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
  late List<List<Square>> sukodu;
  Square? selectedSquare;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    sukodu = List.generate(9, (row) {
      return List.generate(9, (column) => Square(row: row, column: column));
    });
  }

  void problem() {
    reset();
    setState(() {
      Problem.loadProblem1(sukodu);
    });
  }

  void answer() {
    setState(() {
      Solution(sukodu).solve();
    });
  }

  @override
  Widget build(BuildContext context) {
    final boxes = List.generate(
      9,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedSquare?.number = index + 1;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: FittedBox(
            child: Text(
              '${index + 1}',
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Board(
            sukodu: sukodu,
            callback: (Square square) {
              setState(() {
                selectedSquare?.selected = false;
                square.selected = true;
                selectedSquare = square;
              });
            },
          ),
          const SizedBox(
            height: 25,
          ),
          NumberPad(boxes: boxes),
          const SizedBox(
            height: 25,
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

class NumberPad extends StatelessWidget {
  const NumberPad({
    Key? key,
    required this.boxes,
  }) : super(key: key);

  final List<GestureDetector> boxes;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 9,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: boxes,
    );
  }
}
