import 'package:sudoku/square.dart';

class Solution {
  Solution(this.sudoku);
  final List<List<Square>> sudoku;

  solve() {
    solveSudoku(sudoku);
  }

  bool solveSudoku(List<List<Square>> sudoku) {
    int row = 0;
    int col = 0;
    bool isEmpty = false;

// 查找第一个空格
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (sudoku[i][j].number == null) {
          row = i;
          col = j;
          isEmpty = true;
          break;
        }
      }
      if (isEmpty) {
        break;
      }
    }

// 如果数独已经填满了，直接返回 true
    if (!isEmpty) {
      return true;
    }

// 尝试填入 1~9 中的数字
    for (int num = 1; num <= 9; num++) {
      if (canFill(sudoku, row, col, num)) {
        sudoku[row][col].number = num;
        if (solveSudoku(sudoku)) {
          return true;
        }
        sudoku[row][col].number = null;
      }
    }

// 如果无法填入任何数字，则回溯到上一个位置
    return false;
  }

  bool canFill(List<List<Square>> sudoku, int row, int col, int num) {
    // 判断行是否合法
    for (int i = 0; i < 9; i++) {
      if (sudoku[row][i].number == num) {
        return false;
      }
    }

    // 判断列是否合法
    for (int i = 0; i < 9; i++) {
      if (sudoku[i][col].number == num) {
        return false;
      }
    }

    // 判断九宫格是否合法
    int startRow = (row ~/ 3) * 3;
    int startCol = (col ~/ 3) * 3;
    for (int i = startRow; i < startRow + 3; i++) {
      for (int j = startCol; j < startCol + 3; j++) {
        if (sudoku[i][j].number == num) {
          return false;
        }
      }
    }

    return true;
  }
}
