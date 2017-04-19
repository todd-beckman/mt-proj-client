part of mtproj.editor;

class EditorEvents extends EventsCollection {
  final Event onDocumentLoaded;
  final Event onSentDocument;

  EditorEvents(DispatchKey dispatchKey)
      : super(dispatchKey),
        onDocumentLoaded = new Event(dispatchKey),
        onSentDocument = new Event(dispatchKey) {
    [
      onDocumentLoaded,
      onSentDocument,
    ].forEach(manageEvent);
  }
}
