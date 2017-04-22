part of mtproj.lectern;

class LecternEvents extends EventsCollection {
  final Event onDocumentLoaded;

  LecternEvents(DispatchKey dispatchKey)
      : super(dispatchKey),
        onDocumentLoaded = new Event(dispatchKey) {
    [
      onDocumentLoaded,
    ].forEach(manageEvent);
  }
}
