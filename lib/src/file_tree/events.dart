part of mtproj.file_tree;

class FileTreeEvents extends EventsCollection {
  final Event onDocumentSelected;

  FileTreeEvents(DispatchKey dispatchKey)
      : super(dispatchKey),
        onDocumentSelected = new Event(dispatchKey) {
    [
      onDocumentSelected,
    ].forEach(manageEvent);
  }
}
