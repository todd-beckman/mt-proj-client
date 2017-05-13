
import 'package:mtproj/window_framework/window_framework.dart';
import 'package:w_module/w_module.dart';
import 'package:over_react/over_react.dart';

class MockWindowManager extends WindowManager {
  SampleModule module;

  MockWindowManager({
    List<RegionLocation> withoutRegions,
  }) {
    module = new SampleModule();

    if (!withoutRegions.contains(RegionLocation.HEAD)) {
      addDummyContent(RegionLocation.HEAD);
    }
    if (!withoutRegions.contains(RegionLocation.LEFT)) {
      addDummyContent(RegionLocation.LEFT);
    }
    if (!withoutRegions.contains(RegionLocation.BODY)) {
      addDummyContent(RegionLocation.BODY);
    }
    if (!withoutRegions.contains(RegionLocation.RIGHT)) {
      addDummyContent(RegionLocation.RIGHT);
    }
    if (!withoutRegions.contains(RegionLocation.FOOT)) {
      addDummyContent(RegionLocation.FOOT);
    }
  }

  void addDummyContent(RegionLocation location, {int sortOrder: 0}) {
    addContent(new Content(module, sortOrder: sortOrder), location);
  }
}

class SampleModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('sample');

  @override
  SampleEvents events;

  @override
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
  @override
  ReactElement content() => Dom.div()(
    Dom.p()(
      'The big black bug bit the big black bear and the big black bear bled blood. ' *
          20,
    ),
  );
}
