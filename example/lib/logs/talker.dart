import 'package:talker_flutter/talker_flutter.dart';

final talker = Talker(
  logger: TalkerLogger(
    settings: TalkerLoggerSettings(
      level: LogLevel.debug,
    ),
  ),
  settings: TalkerSettings(
    timeFormat: TimeFormat.yearMonthDayAndTime,
    useConsoleLogs: false,
  ),
);
