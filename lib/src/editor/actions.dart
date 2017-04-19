part of mtproj.editor;

class EditorActions extends Disposable {
  Action loadDocument = new Action();
  Action sendDocument = new Action();

  EditorActions() {
    [
      loadDocument,
      sendDocument,
    ].forEach(manageDisposable);
  }
}
