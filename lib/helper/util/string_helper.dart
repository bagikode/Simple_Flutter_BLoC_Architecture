class StringUtils {
  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }

  static String gradeSymbol(int grade) {
    var symbol = "";
    for (var i = 0; i < grade; i++) {
      symbol += "\$";
    }
    return symbol;
  }

  static String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();

  static String removeSymbols(String s) =>
      s.replaceAll(RegExp(r"[^\s\w\.\,\-]"), "");

  static String allowNumberOnly(String s) =>
      s.replaceAll(RegExp(r"[^0-9]"), "");

  static String capitalizeEachWord(String s) {
    var words = s.split(" ");
    List<String> listWord = [];
    var word = "";
    for (int i =0; i < words.length; i ++) {
      word = words[i][0].toUpperCase() + words[i].substring(1);
      listWord.add(word);
    }
    return listWord.join(" ");
  }
}
