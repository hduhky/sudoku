import 'package:sudoku/square.dart';

class Problem {
  static loadProblem1(List<List<Square>> sukodu) {
    sukodu[0][2].number = 9;
    sukodu[0][4].number = 1;
    sukodu[0][6].number = 7;

    sukodu[1][1].number = 7;
    sukodu[1][6].number = 1;
    sukodu[1][7].number = 9;

    sukodu[2][0].number = 1;
    sukodu[2][1].number = 2;
    sukodu[2][2].number = 6;
    sukodu[2][5].number = 3;
    sukodu[2][6].number = 5;
    sukodu[2][8].number = 8;

    sukodu[3][2].number = 4;
    sukodu[3][3].number = 9;
    sukodu[3][5].number = 8;

    sukodu[4][0].number = 8;
    sukodu[4][8].number = 4;

    sukodu[5][3].number = 1;
    sukodu[5][5].number = 5;
    sukodu[5][6].number = 8;

    sukodu[6][0].number = 5;
    sukodu[6][2].number = 1;
    sukodu[6][3].number = 4;
    sukodu[6][6].number = 2;
    sukodu[6][7].number = 8;
    sukodu[6][8].number = 7;

    sukodu[7][1].number = 4;
    sukodu[7][2].number = 3;
    sukodu[7][7].number = 5;

    sukodu[8][2].number = 2;
    sukodu[8][4].number = 5;
    sukodu[8][6].number = 4;
  }
}
