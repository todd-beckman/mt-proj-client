import 'package:w_common/w_common.dart';
import 'package:w_flux/w_flux.dart';

import 'package:mt_api/mt_api.dart';

/// The external API
class FileTreeApi extends Disposable {
  Map<String, File> getFileById;
}

/// The internal API for the Flux cycle
class FileTreeActions extends Disposable {
  Action<String> selectDocument = new Action<String>();

  FileTreeActions() {
    [
      selectDocument,
    ].forEach(manageDisposable);
  }
}
