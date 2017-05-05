import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/common_ui/flexbox.dart';
import 'package:mtproj/lectern/src/api.dart';
import 'package:mtproj/lectern/src/store.dart';

import 'topbar/topbar.dart';
import 'topbar/topbar_item.dart';

/// The "Homepage" of MT.
///
/// Its contents will likely differ drastically for ease of development.
@Factory()
UiFactory<LecternProps> Lectern;

@Props()
class LecternProps extends FluxUiProps<LecternActions, LecternStore> {}

@Component()
class LecternComponent extends FluxUiComponent<LecternProps> {
  @override
  ReactElement render() => (Dom.div()..className = 'lt-body')(
        (TopBar())(
          (TopBarItem())('Some Link'),
          (TopBarItem())('Another One'),
          (TopBarItem())('Shtuff'),
        ),
        (Container()..className = 'lt-content__wrapper')(
          props.store.fileTreeContent,
          props.store.editorContent,
        ),
      );
}
