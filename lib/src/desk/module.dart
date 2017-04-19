part of mtproj.desk;

/// This [Module] is responsible for the ui environment.
class DeskModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('desk module');

  DeskActions _actions;

  DeskComponents get components => _components;
  DeskComponents _components;

  DeskEvents get events => _events;
  DeskEvents _events;

  DeskStore _store;

  DeskModule({
    @required AppContext appContext,
  }) {
    _actions = new DeskActions();
    _events = new DeskEvents(_dispatchKey);

    _store = new DeskStore(
      actions: _actions,
      events: _events,
      dispatchKey: _dispatchKey,
      appContext: appContext,
    );

    _components = new DeskComponents(
      actions: _actions,
      store: _store,
    );
  }

  @override
  Future load() async {
    await _store.load();
  }
}

class DeskComponents extends ModuleComponents {
  DeskActions _actions;
  DeskStore _store;

  DeskComponents({
    @required DeskActions actions,
    @required DeskStore store,
  })
      : _actions = actions,
        _store = store;
}
