part of mtproj.home;

class HomeEvents extends EventsCollection {
  final Event onLoaded;

  HomeEvents(DispatchKey dispatchKey)
      : super(dispatchKey),
        onLoaded = new Event(dispatchKey) {
    [
      onLoaded,
    ].forEach(manageEvent);
  }
}
