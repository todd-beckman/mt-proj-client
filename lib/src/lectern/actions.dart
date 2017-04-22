part of mtproj.lectern;

class LecternActions extends Disposable {
  Action<String> loadDocument = new Action<String>();

  LecternActions() {
    [
      loadDocument,
    ].forEach(manageDisposable);
  }
}
