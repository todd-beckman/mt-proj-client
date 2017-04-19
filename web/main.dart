import 'dart:html';
//import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;
//import 'package:over_react/over_react.dart';

import 'package:mtproj/mtproj.dart';

main() {
  react_client.setClientConfiguration();

  var appContext = new AppContext(
    environment: Environment.LOCAL,
  );

  var home = new EditorModule(
    docId: '1',
    appContext: appContext,
  );
  home.load().then((_) {
    react_dom.render(home.components.content(), querySelector('#body'));
  });
}
