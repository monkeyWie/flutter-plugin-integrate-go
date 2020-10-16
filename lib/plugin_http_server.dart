import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';

import 'package:plugin_http_server/ffi/gopeed_bindings.dart';
import 'package:plugin_http_server/plugin_http_server_interface.dart';

class PluginHttpServer implements PluginHttpServerInterface {
  static PluginHttpServer get instance => _instance;
  static PluginHttpServer _instance;

  static PluginHttpServerInterface _provider;

  /// 加载库
  static init(String lib) {
    if (_instance == null) {
      _instance = PluginHttpServer();
      if (Platform.isWindows) {
        _provider = new _ffiProvider(lib);
      } else {
        _provider = new _channelProvider();
      }
    }
  }

  @override
  Future<void> start(int port) async {
    _provider.start(port);
  }
}

class _ffiProvider implements PluginHttpServerInterface {
  gopeed _ffi;

  _ffiProvider(String lib) {
    _ffi = gopeed(DynamicLibrary.open(lib));
  }

  @override
  Future<void> start(int port) async {
    Future.sync(() => _ffi.Start(port));
  }
}

class _channelProvider implements PluginHttpServerInterface {
  MethodChannel _channel;

  _channelProvider() {
    _channel = MethodChannel('com.gopeed.core.server/http_server');
  }

  @override
  Future<void> start(int port) async {
    await _channel.invokeMethod('start', <String, dynamic>{
      'port': port,
    });
  }
}
