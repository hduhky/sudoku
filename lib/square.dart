class Square {
  Square({
    required this.row,
    required this.column,
    this.number,
  });
  int row;
  int column;
  int? number;
  bool selected = false;
}
