part of mtproj.desk;

class DeskActions extends Disposable {
  Action<String> loadDocument = new Action<String>();

  DeskActions() {
    [
      loadDocument,
    ].forEach(manageDisposable);
  }
}
