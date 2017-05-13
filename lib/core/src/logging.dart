import 'package:logging/logging.dart';

import 'environment.dart';

Logger _log;
Logger log;

void configureLogging(Environment environment) {
  switch (environment) {
    case Environment.LOCAL:
      Logger.root.level = Level.ALL;
      break;
    default:
      Logger.root.level = Level.ALL;
      break;
  }

  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  _log = new Logger('mt');
}
