part of mtproj.desk;

class DeskEvents extends EventsCollection {
  final Event onDocumentLoaded;

  DeskEvents(DispatchKey dispatchKey)
      : super(dispatchKey),
        onDocumentLoaded = new Event(dispatchKey) {
    [
      onDocumentLoaded,
    ].forEach(manageEvent);
  }
}
