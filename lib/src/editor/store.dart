part of mtproj.editor;

class EditorStore extends Store {
  EditorActions _actions;
  DispatchKey _dispatchKey;
  EditorEvents _events;

  Messenger _messenger;

  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  String get html => _html;
  String _html;

  EditorStore({
    @required EditorActions actions,
    @required EditorEvents events,
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

    [
      _actions.loadDocument.listen(_loadDocument),
      _actions.sendDocument.listen(_sendDocument),
    ].forEach(manageActionSubscription);
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
      print(e);
      return;
    }
    _html = payload;
    _isLoaded = true;
    _events.onFetchedDocument(_html, _dispatchKey);
    trigger();
  }

  _loadDocument(_) {
    _fetchData();
  }

  Future _sendDocument(_) async {
    bool success;
    try {
      success = await _messenger.putData(_html);
    } catch (e) {
      print(e);
      return;
    }

    if (!success) {
      print('send failed');
    } else {
      _events.onSentDocument(true, _dispatchKey);
      trigger();
    }
  }
}
