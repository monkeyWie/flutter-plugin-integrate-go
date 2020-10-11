import 'dart:async';

import 'package:flutter/services.dart';

class PluginHttpServer {
  static const MethodChannel _channel =
      const MethodChannel('plugin_http_server');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> start() async {
    await _channel.invokeMethod('start', <String, dynamic>{
      'port': 2633,
    });
  }
}
