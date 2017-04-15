part of mtproj.home;

class HomeModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('home module');

  HomeActions _actions;

  HomeComponents get components => _components;
  HomeComponents _components;

  HomeEvents get events => _events;
  HomeEvents _events;

  HomeStore _store;

  HomeModule() {
    _actions = new HomeActions();
    _events = new HomeEvents(_dispatchKey);

    _store = new HomeStore(
      actions: _actions,
      events: _events,
      dispatchKey: _dispatchKey,
    );

    _components = new HomeComponents(
      actions: _actions,
      store: _store,
    );
  }

  @override
  Future load() async {
    await _store.load();
  }
}

class HomeComponents extends ModuleComponents {
  HomeActions _actions;
  HomeStore _store;

  HomeComponents({
    @required HomeActions actions,
    @required HomeStore store,
  })
      : _actions = actions,
        _store = store;

  @override
  content() => (Home()
    ..actions = _actions
    ..color = MTColor.RED
    ..store = _store)();
}
