part of mtproj.home;

class HomeActions extends Disposable {
  Action loadDocument = new Action();
  Action sendDocument = new Action();

  HomeActions() {
    [
      loadDocument,
      sendDocument,
    ].forEach(manageDisposable);
  }
}
