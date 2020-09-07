main(List<String> args) {
  List<int> clock = [1, 0, 3, 8];
  List<String> clockList = timesForValues(clock);
  print(clockList);
  print(clockList.first);
}

List<String> timesForValues(List<int> clock) {
  clock.sort();
  List<int> numberList = List.from(clock.reversed);
  List<String> clockEnd = [];
  for (int i = 0; i < numberList.length; i++) {
    for (int j = 0; j < numberList.length; j++) {
      List<int> numberLoopList = List.from(numberList);
      if (i != j) {
        int hour = numberList[i] * 10 + numberList[j];
        if (hour <= 24) {
          numberLoopList.remove(numberList[i]);
          numberLoopList.remove(numberList[j]);
          List<int> minutes = [
            numberLoopList.first * 10 + numberLoopList.last,
            numberLoopList.last * 10 + numberLoopList.first
          ];
          minutes.sort();
          minutes = List.from(minutes.reversed);
          minutes.forEach((minute) {
            if (hour == 24 && minute == 0) {
              clockEnd.add("${hour.toDual}:${minute.toDual}");
            } else if (hour < 24 && minute < 60) {
              clockEnd.add("${hour.toDual}:${minute.toDual}");
            }
          });
        }
      }
    }
  }
  if (clockEnd.isEmpty) {
    clockEnd.add("The greatest time not be created");
  }
  return clockEnd.toSet().toList();
}

extension IntExtension on int {
  String get toDual => this.toString().length == 1 ? "0$this" : "$this";
}
