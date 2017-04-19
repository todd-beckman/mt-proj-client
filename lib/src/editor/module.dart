part of mtproj.editor;

class EditorModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('home module');

  EditorActions _actions;

  EditorComponents get components => _components;
  EditorComponents _components;

  EditorEvents get events => _events;
  EditorEvents _events;

  EditorStore _store;

  EditorModule() {
    _actions = new EditorActions();
    _events = new EditorEvents(_dispatchKey);

    _store = new EditorStore(
      actions: _actions,
      events: _events,
      dispatchKey: _dispatchKey,
    );

    _components = new EditorComponents(
      actions: _actions,
      store: _store,
    );
  }

  @override
  Future load() async {
    await _store.load();
  }
}

class EditorComponents extends ModuleComponents {
  EditorActions _actions;
  EditorStore _store;

  EditorComponents({
    @required EditorActions actions,
    @required EditorStore store,
  })
      : _actions = actions,
        _store = store;

  @override
  content() => (Editor()
    ..actions = _actions
    ..color = MTColor.RED
    ..store = _store)();
}
