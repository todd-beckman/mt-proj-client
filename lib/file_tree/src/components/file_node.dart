import 'package:mt_api/mt_api.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/common_ui/flexbox.dart';

const NAME_PADDING = 10;

@Factory()
UiFactory<FileNodeProps> FileNode;

@Props()
class FileNodeProps extends UiProps {
  File file;
  int _depth;
}

@State()
class FileNodeState extends UiState {
  bool collapsed;
}

@Component()
class FileNodeComponent
    extends UiStatefulComponent<FileNodeProps, FileNodeState> {
  BlockComponent _fileNameRef;

  @override
  FileNodeState getInitialState() => newState()..collapsed = false;

  @override
  FileNodeProps getDefaultProps() => newProps().._depth = 0;

  @override
  ReactElement render() {
    var items = <ReactElement>[
      (Block()
        ..key = 'name'
        ..className = 'ft-file__name'
        ..ref = ((ref) {
          _fileNameRef = ref;
        })
        ..onClick = _handleClick)(
        _padName(props.file.name, props._depth),
      ),
    ];

    if (!state.collapsed) {
      items.add(
        (Container()
          ..key = 'list'
          ..vertical = true
          ..className = 'ft-file-list__container')(
          _renderFileList(props.file, props._depth),
        ),
      );
    }

    return (Block()..className = 'ft-file')(
      items,
    );
  }

  List<ReactElement> _renderFileList(File file, int depth) {
    var items = <ReactElement>[];

    file.children.forEach((File file) {
      items.add(
        (Block()
          ..key = file.id
          ..className = 'ft-list__file')(
          (FileNode()
            ..file = file
            .._depth = props._depth + 1)(),
        ),
      );
    });
    return items;
  }

  ReactElement _padName(String name, int depth) =>
      (Dom.span()..className = 'ft-file-name__content')(
        (Dom.span()..className = 'ft-file-name__padding')(
          ' | ' * depth,
        ),
        (Dom.span()..className = 'ft-file-name__expand-icon')(
          _renderExpandedState(),
        ),
        name,
      );

  _renderExpandedState() {
    if (props.file.children?.length == 0) {
      return '';
    }
    if (state.collapsed == true) {
      return '> ';
    }
    return 'v ';
  }

  _handleClick(e) {
    setState(newState()..collapsed = !state.collapsed);
  }
}
