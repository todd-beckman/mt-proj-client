part of mtproj.lectern;

class LecternStore extends Store {
  LecternActions _actions;
  DispatchKey _dispatchKey;
  LecternEvents _events;

  final AppContext appContext;

  LecternStore({
    @required LecternActions actions,
    @required AppContext this.appContext,
    @required DispatchKey dispatchKey,
    @required LecternEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    didDispose.then((_) {
      _actions = null;
      _events = null;
    });
  }

  Future load() async {
    print('loaded');
  }
}
