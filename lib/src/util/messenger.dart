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

    var url = '$endpoint/get';

    _client.read(url).then((content) {
      print(content);
      c.complete(content);
    }).catchError((e) {
      print(e);
      c.complete(null);
    });

    return c.future;
  }

  Future<bool> putData(String data) async {
    Completer<bool> c = new Completer();

    var url = '$endpoint/post';

    _client.post(url).then((response) {
      print(response.body);
      c.complete(true);
    }).catchError((e) {
      print(e);
      c.complete(false);
    });

    return c.future;
  }
}
