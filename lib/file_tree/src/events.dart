import 'package:w_module/w_module.dart';

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
