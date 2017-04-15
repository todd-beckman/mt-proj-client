import 'dart:async';
import 'dart:core';

import 'package:http/browser_client.dart' as http;
import 'package:w_common/w_common.dart';

class Messenger extends Disposable {
  http.BrowserClient _client;
  final String endpoint;
  Messenger(String this.endpoint) {
    _client = new http.BrowserClient();
  }

  Future<String> fetchData() async {
    Completer<String> c = new Completer();

    _client.read(endpoint).then((content) {
      print(content);
      c.complete(content);
    }).catchError((e) {
      print(e);
      c.complete(null);
    });

    return c.future;
  }
}
