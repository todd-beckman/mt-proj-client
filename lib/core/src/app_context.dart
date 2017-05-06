import 'dart:async';

import 'package:meta/meta.dart' show required;

import 'messenger.dart';
import 'session.dart';

// An enumeration of the environment type
class Environment {
  static int _idFactory = 0;

  /// This [id] is only used to tell Environments apart.
  int get id => _id;
  int _id;

  /// This [docServer] points to the environment's default endpoint
  String get docServer => _docServer;
  final String _docServer;

  Environment({
    @required String docServer,
  })
      : _docServer = docServer {
    _id = _idFactory++;
  }

  /// The default environment configuration for a local environment
  static final Environment LOCAL =
      new Environment(docServer: 'ws://127.0.0.1:5080/ws');
}

class AppContext {
  final Environment environment;

  Session get session => _session;
  Session _session;

  Messenger get messenger => _messenger;
  Messenger _messenger;

  bool _isLoaded = false;

  AppContext({
    @required Environment this.environment,
  }) {
    _session = new Session(userId: 'some-user-id');
    _messenger = new Messenger(
      environment: environment,
      session: session,
    );
  }

  Future<Null> load() async {
    if (_isLoaded) {
      print('Context already loaded!');
      return;
    }

    await _messenger.load();
  }
}
