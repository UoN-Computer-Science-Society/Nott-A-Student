import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:slack_logger/slack_logger.dart';

class CustomLogger {
  final Logger _log = Logger('CustomLogger');

  // Slack logger instance
  final SlackLogger _slackLogger = SlackLogger(
      webhookUrl:
          "https://hooks.slack.com/services/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");

  CustomLogger() {
    _configureLogger();
  }

  // Configure the Logger to log to the console and Slack
  void _configureLogger() {
    hierarchicalLoggingEnabled = true;
    _log.level = Level.ALL;

    // Handle logs
    _log.onRecord.listen((LogRecord record) {
      _logToConsole(record);

      // Log only severe and above errors to Slack

      _logToSlack(record);
    });
  }

  // Log to the console
  void _logToConsole(LogRecord record) {
    log(
        '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  }

  // Log to Slack using the slacklogger package
  void _logToSlack(LogRecord record) async {
    try {
      String message = '*${record.level.name}*:\n'
          '_Time:_ ${record.time}\n'
          '_Logger:_ ${record.loggerName}\n'
          '_Message:_ ${record.message}';

      if (record.stackTrace != null) {
        message += '\n_Stack Trace:_ ${record.stackTrace}';
      }

      await _slackLogger.send(message);
    } catch (error) {
      debugPrint('Error sending log to Slack: $error');
    }
  }

  // Public logging methods
  void info(String message) => _log.info(message);
  void warning(String message) => _log.warning(message);
  void error(String message, [StackTrace? stackTrace]) =>
      _log.severe(message, '', stackTrace);
}
