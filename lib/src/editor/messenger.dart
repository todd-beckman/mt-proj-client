part of mtproj.editor;

/// A class used to interface between the editor and the document server.
class EditorMessenger extends Disposable {
  http.BrowserClient _client;

  /// The root URL of the document server
  String get docServer => _docServer;
  String _docServer;

  EditorMessenger(Environment environment) {
    _client = new http.BrowserClient();
    _docServer = environment.docServer;
  }

  Future<String> fetchData(String docId) async {
    Completer<String> c = new Completer();

    var encodedDocId = encodeBase64ForUrl(docId);
    var url = getDocUrl(docServer, encodedDocId);

    _client.read(url).then((content) {
      print(content);
      c.complete(content);
    }).catchError((e) {
      print(e);
      c.complete(null);
    });

    return c.future;
  }

  Future<bool> putData(String docId, String data) async {
    Completer<bool> c = new Completer();

    var encodedDocId = encodeBase64ForUrl(docId);
    var url = postDocUrl(docServer, encodedDocId);

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
