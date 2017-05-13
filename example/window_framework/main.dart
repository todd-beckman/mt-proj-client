import 'dart:html';

import 'package:mtproj/window_framework/window_framework.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;
import 'package:w_module/w_module.dart';

main() {
  react_client.setClientConfiguration();

  var windowManager = new WindowManager();

  windowManager.addContent(buildContent(0), RegionLocation.HEAD);
  windowManager.addContent(buildContent(0), RegionLocation.LEFT);
  windowManager.addContent(buildContent(0), RegionLocation.BODY);
  windowManager.addContent(buildContent(0), RegionLocation.RIGHT);
  windowManager.addContent(buildContent(0), RegionLocation.FOOT);

  react_dom.render(windowManager.content(), querySelector('#body'));
}

Content buildContent(int sortOrder) {
  return new Content(new SampleModule(), sortOrder: sortOrder);
}

class SampleModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('sample');

  SampleEvents events;

  SampleComponents components;

  SampleModule() {
    events = new SampleEvents(_dispatchKey);
    components = new SampleComponents();
  }
}

class SampleEvents extends EventsCollection {
  SampleEvents(DispatchKey dispatchKey) : super(dispatchKey);
}

class SampleComponents extends ModuleComponents {
  react_client.ReactElement content() => Dom.div()(
    Dom.p()(
      'The big black bug bit the big black bear and the big black bear bled blood. ' *
          20,
    ),
  );
}

