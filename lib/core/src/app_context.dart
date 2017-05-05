import 'package:meta/meta.dart' show required;

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
      new Environment(docServer: 'http://127.0.0.1:5080');
}

// TODO in the future try to fetch this from the environment
// For now just use hard-coded for dev
class AppContext {
  final Environment environment;

  AppContext({
    @required Environment this.environment,
  });
}
