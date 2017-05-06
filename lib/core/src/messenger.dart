import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mt_api/mt_api.dart' as api;
import 'package:thrift/thrift.dart';
import 'package:thrift/thrift_browser.dart';
import 'package:uuid/uuid.dart';
import 'package:w_common/w_common.dart';

import 'app_context.dart';
import 'session.dart';

class Messenger extends Disposable {
  Uuid _uuid;
  Environment _environment;
  Session _session;

  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  TTransport _transport;
  api.MTProjClient _client;

  Messenger({
    @required Environment environment,
    @required Session session,
  })
      : _environment = environment,
        _session = session,
        _uuid = new Uuid();

  Future<Null> load() async {
    try {
      // TODO: make this work
      //await _initConnection();
    } catch (e) {
      print(e);
      return;
    }

    _isLoaded = true;
  }

  void _initConnection() {
    _transport = new TAsyncClientSocketTransport(
      new TWebSocket(Uri.parse(_environment.docServer)),
      new TMessageReader(new TBinaryProtocolFactory()),
    );
    var protocol = new TBinaryProtocol(_transport);
    _transport.open();

    _client = new api.MTProjClient(protocol);
  }

  api.Context _makeContext(String method) => new api.Context()
    ..correlationId = '[${_uuid.v4()}] ${_session.userId} - $method'
    ..userId = _session.userId;

  Future<api.File> getFileTree(String projectId) =>
      _client.getFileTreeForProject(_makeContext('getFileTree'), projectId);
}
