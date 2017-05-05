import 'dart:async';

import 'package:meta/meta.dart' show required;
import 'package:react/react_client.dart';
import 'package:w_module/w_module.dart';
import 'package:w_flux/w_flux.dart';

import 'package:mtproj/core/core.dart';
import 'package:mtproj/editor/editor.dart';
import 'package:mtproj/file_tree/file_tree.dart';

import 'api.dart';
import 'events.dart';


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
    );

    _fileTree = new FileTreeModule(
      appContext: appContext,
    );
  }

  Future load() async {
    await _editor.load();
    await _fileTree.load();

    _editor.api.loadDocument('a-glorious-doc');
    print('loaded');
  }
}
