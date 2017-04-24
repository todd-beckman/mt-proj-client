part of mtproj.file_tree;

class FileTreeActions extends Disposable {
  Action<String> selectDocument = new Action<String>();

  FileTreeActions() {
    [
      selectDocument,
    ].forEach(manageDisposable);
  }
}
