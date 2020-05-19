class Colorize {
  static final String esc = "\u{1B}";

  String initial = '';

  Colorize([this.initial = '']);

  @override
  String toString() => initial;

  Future<Colorize> apply(Styles style, [String text]) async {
    if (text == null) {
      text = initial;
    }

    initial = _applyStyle(style, text);
    return this;
  }

  void white() {
    apply(Styles.white);
  }

  void yellow() {
    apply(Styles.yellow);
  }

  void bgRed() {
    apply(Styles.bgRed);
  }

  void red() {
    apply(Styles.red);
  }

  String buildEscSeq(Styles style) {
    return esc + "[${getStyle(style)}m";
  }

  String _applyStyle(Styles style, String text) {
    return buildEscSeq(style) + text + buildEscSeq(Styles.reset);
  }

  static String getStyle(Styles style) {
    switch (style) {
      case Styles.reset:
        return '0';
      case Styles.red:
        return '31';
      case Styles.yellow:
        return '33';
      case Styles.white:
        return '97';
      case Styles.bgRed:
        return '41';
      default:
        return '';
    }
  }
}

enum Styles {
  reset,
  red,
  yellow,
  white,
  bgRed,
}
