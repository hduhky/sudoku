import 'package:flutter/material.dart';
import 'package:sudoku/square.dart';

class Board extends StatelessWidget {
  const Board({
    super.key,
    required this.sukodu,
    required this.callback,
  });

  final List<List<Square>> sukodu;
  final InputBoxCallback callback;

  @override
  Widget build(BuildContext context) {
    final squares = [];
    for (var element in sukodu) {
      for (var square in element) {
        squares.add(square);
      }
    }
    final boxes = List.generate(
      squares.length,
      (index) => InputBox(
        square: squares[index],
        callback: callback,
      ),
    );
    return GridView.count(
      crossAxisCount: 9,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: boxes,
    );
  }
}

typedef InputBoxCallback = void Function(Square square);

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    required this.square,
    required this.callback,
  });

  final Square square;
  final InputBoxCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback.call(square),
      child: ColoredBox(
        color: square.selected ? Colors.blue[400]! : Colors.blue[200]!,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: FittedBox(
            child: Text(
              '${square.number ?? ''}',
            ),
          ),
        ),
      ),
    );
  }
}
