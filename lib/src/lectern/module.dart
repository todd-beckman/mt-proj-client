part of mtproj.lectern;

/// This [Module] is responsible for the ui environment.
class LecternModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('desk module');

  LecternActions _actions;

  LecternComponents get components => _components;
  LecternComponents _components;

  LecternEvents get events => _events;
  LecternEvents _events;

  LecternStore _store;

  LecternModule({
    @required AppContext appContext,
  }) {
    _actions = new LecternActions();
    _events = new LecternEvents(_dispatchKey);

    _store = new LecternStore(
      actions: _actions,
      events: _events,
      dispatchKey: _dispatchKey,
      appContext: appContext,
    );

    _components = new LecternComponents(
      actions: _actions,
      store: _store,
    );
  }

  @override
  Future load() async {
    await _store.load();
  }
}

class LecternComponents extends ModuleComponents {
  LecternActions _actions;
  LecternStore _store;

  LecternComponents({
    @required LecternActions actions,
    @required LecternStore store,
  })
      : _actions = actions,
        _store = store;

  @override
  ReactElement content() => (Lectern()
    ..actions = _actions
    ..store = _store)();
}
