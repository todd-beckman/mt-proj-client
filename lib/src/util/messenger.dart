import 'dart:async';
import 'package:w_common/w_common.dart';

class Messenger extends Disposable {
  final String endpoint;
  Messenger(String this.endpoint);

  Future<String> fetchData() async {
    return await '<p>something fancy</p>';
  }
}
