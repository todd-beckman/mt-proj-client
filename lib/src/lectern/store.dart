part of mtproj.lectern;

class LecternStore extends Store {
  LecternActions _actions;
  DispatchKey _dispatchKey;
  LecternEvents _events;

  final AppContext appContext;

  EditorModule _editor;
  ReactElement get editorContent => _editor.components.content();

  FileTreeModule _fileTree;
  ReactElement get fileTreeContent => _fileTree.components.content();

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
      _editor = null;
      _events = null;
      _fileTree = null;
    });

    _editor = new EditorModule(
      appContext: appContext,
      docId: 'an-enigmatic-doc',
    );

    _fileTree = new FileTreeModule(
      appContext: appContext,
    );
  }

  Future load() async {
    await _editor.load();
    await _fileTree.load();
    print('loaded');
  }
}
