part of mtproj.editor;

class EditorStore extends Store {
  EditorActions _actions;
  DispatchKey _dispatchKey;
  EditorEvents _events;

  final String docId;
  final AppContext appContext;

  EditorMessenger _messenger;

  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  String get html => _html;
  String _html;

  EditorStore({
    @required EditorActions actions,
    @required AppContext this.appContext,
    @required DispatchKey dispatchKey,
    @required String this.docId,
    @required EditorEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    _messenger = new EditorMessenger(appContext.environment);
    manageDisposable(_messenger);
    didDispose.then((_) {
      _actions = null;
      _events = null;
      _messenger = null;
      _html = null;
    });

    _refresh();
  }

  Future load() async {
    /* TODO: load content
    _fetchData();

    [
      _actions.loadDocument.listen((_) => _fetchData),
      _actions.saveDocument.listen((_) => _sendDocument),
    ].forEach(manageActionSubscription);
    */
  }

  void _refresh() {
    _isLoaded = false;
    _html = '';
  }

  Future _fetchData() async {
    String payload;
    try {
      payload = await _messenger.fetchData(docId);
    } catch (e) {
      print(e);
      return;
    }
    _html = payload;
    _isLoaded = true;
    _events.onDocumentLoaded(docId, _dispatchKey);
    trigger();
  }

  Future _sendDocument(_) async {
    try {
      var response = await _messenger.putData(docId, _html);
      print(response);
    } catch (e) {
      print(e);
      return;
    }

    _events.onSentDocument(true, _dispatchKey);
    trigger();
  }
}
