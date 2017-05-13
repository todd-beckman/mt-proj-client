import 'dart:html';

import 'package:mtproj/window_framework/window_framework.dart';
import 'package:mtproj/window_framework/window_framework_mock.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;
import 'package:w_module/w_module.dart';

main() {
  react_client.setClientConfiguration();

  var windowManager = new MockWindowManager();

  react_dom.render(windowManager.content(), querySelector('#body'));
}


