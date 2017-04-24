part of mtproj.file_tree;

class FileTreeStore extends Store {
  final AppContext appContext;
  FileTreeActions _actions;
  FileTreeEvents _events;
  FileTreeMessenger _messenger;

  DispatchKey _dispatchKey;

  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  FileTreeStore({
    @required AppContext this.appContext,
    @required FileTreeActions actions,
    @required DispatchKey dispatchKey,
    @required FileTreeEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    _messenger = new FileTreeMessenger(appContext.environment);
    manageDisposable(_messenger);
    didDispose.then((_) {
      _actions = null;
      _events = null;
      _messenger = null;
    });
  }

  void refresh() {
    _isLoaded = false;
  }
}
