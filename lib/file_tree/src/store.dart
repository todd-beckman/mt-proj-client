import 'dart:async';

import 'package:meta/meta.dart';
import 'package:w_flux/w_flux.dart';
import 'package:w_module/w_module.dart';

import 'package:mtproj/core/core.dart';
import 'package:mtproj/common_util/utils.dart';

import 'api.dart';
import 'events.dart';
import 'messenger.dart';
import 'models.dart';

class FileTreeStore extends Store {
  final AppContext appContext;
  FileTreeActions _actions;
  FileTreeEvents _events;
  FileTreeMessenger _messenger;

  DispatchKey _dispatchKey;

  /// Whether the calls from the server have returned with data that can be rendered for the user.
  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  /// The list of files available.
  ///
  /// TODO: support for hierarchy
  List<File> get files => _files;
  List<File> _files;

  FileTreeStore({
    @required AppContext this.appContext,
    @required FileTreeActions actions,
    @required DispatchKey dispatchKey,
    @required FileTreeEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    _messenger = new FileTreeMessenger(appContext.environment);
    manageDisposable(_messenger);
    didDispose.then((_) {
      _actions = null;
      _events = null;
      _messenger = null;
      _files = null;
    });

    refresh();
  }

  void refresh() {
    _isLoaded = false;
    _files = [];
  }

  Future load() async {
    await loadFileList();
  }

  // TODO: actually make this hit the server
  Future loadFileList() async {
    _files = [
      new File(displayName: 'Lorem Ipsum', id: '${KeyIncrementer.nextKey}'),
      new File(displayName: 'A Frog Borg', id: '${KeyIncrementer.nextKey}'),
      new File(displayName: 'Very Fancy Doc', id: '${KeyIncrementer.nextKey}'),
      new File(displayName: 'Kung Pao', id: '${KeyIncrementer.nextKey}'),
    ];
    trigger();
  }
}
