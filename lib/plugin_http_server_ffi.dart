import 'dart:ffi';

import 'package:plugin_http_server/gopeed_bindings.dart';

final _gopeed = gopeed(DynamicLibrary.open("../windows/libs/gopeed.dll"));

class PluginHttpServer {
  static void start(int port) {
    _gopeed.Start(port);
  }
}
