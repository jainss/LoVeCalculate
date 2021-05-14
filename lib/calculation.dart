int calculation({String firstName, String secondName}) {
  int finalScore;
  List<String> firstList = firstName.toLowerCase().split('');
  List<String> secondList = secondName.toLowerCase().split('');
  List<String> magicWord = firstList + "loves".split('') + secondList;
  print(magicWord);
  //Now the word are broken into character and now we will start counting in next steps.
  var nameMap = new Map();
  magicWord.forEach((f) {
    nameMap.containsKey(f) ? nameMap[f]++ : nameMap[f] = 1;
  });
  print(nameMap.values);
  //now make it a list
  List magicCode = nameMap.values.toList();
  print(magicCode);
  List score;
  while (magicCode.length > 2) {
    score = _calculate(magicCode);
    magicCode = score;
    print(score);
  }
  finalScore = magicCode[0] * 10 + magicCode[1];
  return finalScore;
}
//now make a calculate funtion and return list every time

List _calculate(List magicCode) {
  int countSum;
  // ignore: deprecated_member_use
  List score = new List();
  do {
    countSum = magicCode.first + magicCode.last;
    if (countSum > 9) {
      countSum -= 9;
    }
    score.add(countSum);
    magicCode.removeLast();
    magicCode.removeAt(0);
  } while (magicCode.length >= 2);
  print(magicCode);
  if (magicCode.isNotEmpty) {
    score.add(magicCode.first);
  }
  return score;
}
