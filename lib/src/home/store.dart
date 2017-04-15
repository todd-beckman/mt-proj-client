part of mtproj.home;

class HomeStore extends Store {
  HomeActions _actions;
  DispatchKey _dispatchKey;
  HomeEvents _events;

  Messenger _messenger;

  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  String get html => _html;
  String _html;

  HomeStore({
    @required HomeActions actions,
    @required HomeEvents events,
    @required DispatchKey dispatchKey,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    _messenger = new Messenger(MTUrls.LOCAL);
    manageDisposable(_messenger);
    didDispose.then((_) {
      actions = null;
      events = null;
      _messenger = null;
      _html = null;
    });

    _refresh();
  }

  Future load() async {
    _fetchData();

    manageActionSubscription(_actions.loadDocument.listen(_loadDocument));
  }

  void _refresh() {
    _isLoaded = false;
    _html = '';
  }

  Future _fetchData() async {
    String payload;
    try {
      payload = await _messenger.fetchData();
    } catch (e) {
      print('oops');
      print(e);
      return;
    }
    _html = payload;
    _isLoaded = true;
    _events.onLoaded(_html, _dispatchKey);
    trigger();
  }

  _loadDocument(_) {
    _fetchData();
  }
}
