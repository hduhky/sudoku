import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({
    super.key,
    required this.sukodu,
  });

  final List<List<int?>> sukodu;

  @override
  Widget build(BuildContext context) {
    final numbers = [];
    for (var element in sukodu) {
      for (var number in element) {
        numbers.add(number);
      }
    }
    final boxes = List.generate(
      numbers.length,
      (index) => InputBox(
        number: numbers[index],
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

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.number});

  final int? number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: FittedBox(
        child: Text(
          '${number ?? ''}',
        ),
      ),
    );
  }
}
