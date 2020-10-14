import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:plugin_http_server/ffi/gopeed_bindings.dart';

class PluginHttpServer {
  // 工厂模式
  factory PluginHttpServer() => _getInstance();

  static PluginHttpServer get instance => _getInstance();
  static PluginHttpServer _instance;

  MethodChannel _channel;
  gopeed _ffi;

  PluginHttpServer._internal() {
    // 初始化
    if (Platform.isAndroid) {
      _channel = MethodChannel('com.gopeed.core.server/http_server');
    } else if (Platform.isWindows) {
      _ffi = gopeed(DynamicLibrary.open("../windows/libs/gopeed.dll"));
    }
  }

  static PluginHttpServer _getInstance() {
    if (_instance == null) {
      _instance = new PluginHttpServer._internal();
    }
    return _instance;
  }

  Future<void> start() async {
    const port = 2633;
    if (Platform.isAndroid) {
      await _channel.invokeMethod('start', <String, dynamic>{
        'port': port,
      });
    } else {
      Future.sync(() => _ffi.Start(port));
    }
  }
}
