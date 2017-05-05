import 'dart:async';

import 'package:http/browser_client.dart' as http;
import 'package:w_common/w_common.dart';

import 'package:mtproj/core/src/app_context.dart';

class Messenger extends Disposable {
  http.BrowserClient _client;

  /// The root URL of the document server
  String get docServer => _docServer;
  String _docServer;

  Messenger(Environment environment) {
    _client = new http.BrowserClient();
    _docServer = environment.docServer;
  }

  /// Fetches data from the server
  Future<String> get(String url) async {
    Completer<String> c = new Completer();

    _client.read('$_docServer$url').then((content) {
      print(content);
      c.complete(content);
    }).catchError((e) {
      throw e;
    });

    return c.future;
  }

  /// Posts data to the server and returns the response.
  Future<String> put(String url, data) async {
    Completer<String> c = new Completer();

    _client.put('$_docServer$url', body: data).then((response) {
      c.complete(response.body);
    }).catchError((e) {
      throw (e);
    });

    return c.future;
  }
}
