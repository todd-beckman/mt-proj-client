import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/common_ui/flexbox.dart';
import 'package:mtproj/file_tree/src/api.dart';
import 'package:mtproj/file_tree/src/store.dart';
import 'package:mtproj/file_tree/src/models.dart';

@Factory()
UiFactory<FileTreeProps> FileTree;

@Props()
class FileTreeProps extends FluxUiProps<FileTreeActions, FileTreeStore> {}

@Component()
class FileTreeComponent extends FluxUiComponent<FileTreeProps> {
  @override
  ReactElement render() => (Block()..className = 'ft-body')(
        (Dom.ul()..className = 'ft-list')(
          _renderItems(),
        ),
      );

  _renderItems() => props.store.files.map(
        (File file) => (Dom.li()
              ..key = file.id
              ..className = 'ft-list__file')(
              file.displayName,
            ),
      );
}
