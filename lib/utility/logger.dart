import 'package:logger/logger.dart';

const String reset = '\x1B[0m';
const String black = '\x1B[30m';
const String red = '\x1B[31m';
const String green = '\x1B[32m';
const String yellow = '\x1B[33m';
const String blue = '\x1B[34m';
const String magenta = '\x1B[35m';
const String cyan = '\x1B[36m';
const String white = '\x1B[37m';

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter(this.className);
  final String className;

  @override
  List<String> log(LogEvent event) {
    String color;
    switch (event.level) {
      case Level.debug:
        color = cyan;
      case Level.info:
        color = green;
      case Level.warning:
        color = yellow;
      case Level.error:
        color = red;

      default:
        color = white;
    }
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];

    return [
      '$color$emoji [$className] ${event.message}',
    ];
  }
}

class CustomLogger {
  static Logger getLogger(String className) {
    return Logger(
      printer: SimpleLogPrinter(className),
    );
  }
}
