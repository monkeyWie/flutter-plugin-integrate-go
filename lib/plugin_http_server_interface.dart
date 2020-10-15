import 'dart:async';

abstract class PluginHttpServerInterface {
  Future<void> start(int port);
}
