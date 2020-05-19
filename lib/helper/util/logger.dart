import 'colorize_logger.dart';
import 'package:meta/meta.dart' show required;

class Logger {
  static void log(String tag, {@required String message}) {
    assert(tag != null);

    final log = Colorize('[$tag] $message');
    log.bgRed();
    print(log);
  }
}