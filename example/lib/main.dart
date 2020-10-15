import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:plugin_http_server/plugin_http_server.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _flag = 'Loading';

  @override
  void initState() {
    super.initState();
    start();
  }

  Future<void> start() async {
    if (Platform.isWindows) {
      PluginHttpServer.init("data/flutter_assets/windows/libs/gopeed.dll");
    } else {
      PluginHttpServer.init(null);
    }
    print("after init");
    PluginHttpServer.instance.start(2633);
    print("after server start");
    setState(() {
      _flag = "Running";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Server status: $_flag\n'),
        ),
      ),
    );
  }
}
