part of mtproj.desk;

class DeskStore extends Store {
  DeskActions _actions;
  DispatchKey _dispatchKey;
  DeskEvents _events;

  final AppContext appContext;

  DeskStore({
    @required DeskActions actions,
    @required AppContext this.appContext,
    @required DispatchKey dispatchKey,
    @required DeskEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    didDispose.then((_) {
      _actions = null;
      _events = null;
    });
  }

  Future load() async {}
}
