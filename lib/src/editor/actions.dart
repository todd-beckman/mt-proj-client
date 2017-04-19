part of mtproj.editor;

class EditorActions extends Disposable {
  Action<String> loadDocument = new Action<String>();
  Action saveDocument = new Action();

  EditorActions() {
    [
      loadDocument,
      saveDocument,
    ].forEach(manageDisposable);
  }
}
