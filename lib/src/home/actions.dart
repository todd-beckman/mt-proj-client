part of mtproj.home;

class HomeActions extends Disposable {
  Action loadDocument = new Action();

  HomeActions() {
    [
      loadDocument,
    ].forEach(manageDisposable);
  }
}
