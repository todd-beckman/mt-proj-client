part of mtproj.editor;

class EditorEvents extends EventsCollection {
  final Event onFetchedDocument;
  final Event onSentDocument;

  EditorEvents(DispatchKey dispatchKey)
      : super(dispatchKey),
        onFetchedDocument = new Event(dispatchKey),
        onSentDocument = new Event(dispatchKey) {
    [
      onFetchedDocument,
      onSentDocument,
    ].forEach(manageEvent);
  }
}
