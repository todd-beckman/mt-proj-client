import 'package:w_common/w_common.dart';
import 'package:w_flux/w_flux.dart';

/// The internal APi for the Flux cycle
class FileTreeActions extends Disposable {
  Action<String> selectDocument = new Action<String>();

  FileTreeActions() {
    [
      selectDocument,
    ].forEach(manageDisposable);
  }
}