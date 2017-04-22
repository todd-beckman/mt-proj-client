part of mtproj.lectern;

class LecternStore extends Store {
  LecternActions _actions;
  DispatchKey _dispatchKey;
  LecternEvents _events;

  final AppContext appContext;

  EditorModule _editor;
  ReactElement get editorContent => _editor.components.content();

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
      _editor = null;
    });

    _editor = new EditorModule(
      appContext: appContext,
      docId: 'an-enigmatic-doc',
    );
  }

  Future load() async {
    await _editor.load();
    print('loaded');
  }
}
