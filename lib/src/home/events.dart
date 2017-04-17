part of mtproj.home;

class HomeEvents extends EventsCollection {
  final Event onFetchedDocument;
  final Event onSentDocument;

  HomeEvents(DispatchKey dispatchKey)
      : super(dispatchKey),
        onFetchedDocument = new Event(dispatchKey),
        onSentDocument = new Event(dispatchKey) {
    [
      onFetchedDocument,
      onSentDocument,
    ].forEach(manageEvent);
  }
}
