part of mtproj.file_tree;

class FileTreeModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('desk module');

  FileTreeActions _actions;

  @override
  FileTreeEvents get events => _events;
  FileTreeEvents _events;

//  FileTreeApi get api => _api;
//  FileTreeApi _api;

  FileTreeComponents get components => _components;
  FileTreeComponents _components;

  FileTreeStore _store;

  FileTreeModule({
    @required AppContext appContext,
  }) {
    _actions = new FileTreeActions();
    _events = new FileTreeEvents(_dispatchKey);

    _store = new FileTreeStore(
      appContext: appContext,
      actions: _actions,
      events: _events,
      dispatchKey: _dispatchKey,
    );

    _components = new FileTreeComponents(
      actions: _actions,
      store: _store,
    );
  }

  @override
  Future load() async {
    _store.load();
  }
}

class FileTreeComponents extends ModuleComponents {
  FileTreeActions _actions;
  FileTreeStore _store;

  FileTreeComponents({
    @required FileTreeActions actions,
    @required FileTreeStore store,
  })
      : _actions = actions,
        _store = store;

  @override
  ReactElement content() => (FileTree()
    ..actions = _actions
    ..store = _store)();
}
