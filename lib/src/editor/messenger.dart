part of mtproj.editor;

/// A class used to interface between the editor and the document server.
class EditorMessenger extends Messenger {
  EditorMessenger(Environment environment) : super(environment);

  Future<String> fetchData(String docId) async =>
      get('/doc/${encodeBase64ForUrl(docId)}');

  Future<String> putData(String docId, String data) async =>
      post('/doc/${encodeBase64ForUrl(docId)}', data);
}
