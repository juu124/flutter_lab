void main() {
  testFun([10, 5, 20, 4]);
  testFun([3, 5, 1, 3]);
}

void testFun(List<int> list) {
  late int score;
  var result = 0;
  var min = list[0];
  var max = list[0];

  for (score in list) {
    if (score < min) {  // 최저 점수
      min = score;
    } else if (score > max) { // 최고 점수
      max = score;
    }
    result += score;  // 총합
  }

  String printText = "최고 점수: $max \n"
      "최저 점수: $min \n"
      "점수 총합: $result \n"
      "점수 평균: ${result~/list.length} \n";

  print(printText);
}
