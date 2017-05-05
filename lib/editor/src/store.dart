import 'dart:async';

import 'package:meta/meta.dart' show required;
import 'package:w_flux/w_flux.dart';
import 'package:w_module/w_module.dart';

import 'package:mtproj/core/core.dart';

import 'api.dart';
import 'events.dart';
import 'messenger.dart';

class EditorStore extends Store {
  EditorActions _actions;
  DispatchKey _dispatchKey;
  EditorEvents _events;

  final AppContext appContext;

  EditorMessenger _messenger;

  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  Map<String, String> get docs => _docs;
  Map<String, String> _docs;

  EditorStore({
    @required EditorActions actions,
    @required AppContext this.appContext,
    @required DispatchKey dispatchKey,
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
      _docs = null;
    });
  }

  Future load() async {
    _refresh();

    [
      _actions.loadDocument.listen(_fetchDataForDocument),
      _actions.saveDocument.listen(_sendDocument),
    ].forEach(manageActionSubscription);

    _isLoaded = true;
  }

  void _refresh() {
    _isLoaded = false;
    _docs = {};
  }

  Future _fetchDataForDocument(String docId) async {
    String payload;
    try {
      payload = await _messenger.fetchData(docId);
    } catch (e) {
      print(e);
      return;
    }
    _docs[docId] = payload;
    _isLoaded = true;
    _events.onDocumentLoaded(docId, _dispatchKey);
    trigger();
  }

  Future _sendDocument(String docId) async {
    if (_docs[docId] == null) {
      print('Doc $docId does not exist');
      return;
    }
    try {
      var response = await _messenger.putData(docId, _docs[docId]);
      print(response);
    } catch (e) {
      print(e);
      return;
    }

    _events.onSentDocument(true, _dispatchKey);
  }
}
