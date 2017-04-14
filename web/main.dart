import 'dart:html';
//import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;
//import 'package:over_react/over_react.dart';

import 'package:mtproj/src/home.dart';

main() {
  react_client.setClientConfiguration();

  var home = new MTHome();
  react_dom.render(home.content, querySelector('#body'));
}
