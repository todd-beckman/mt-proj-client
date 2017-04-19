part of mtproj.editor;

class EditorApi {
  final EditorActions _actions;

  EditorApi(EditorActions actions) : _actions = actions;

  /// Loads the document for the given ID
  Future loadDocument(String docId) => _actions.loadDocument(docId);

  Future saveDocument() => _actions.saveDocument();
}
