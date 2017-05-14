import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/core/core.dart' show log;
import 'package:mtproj/common_ui/mt_skin.dart';

import 'region_template.dart';
import 'tall_toolbar.dart';
import '../region_manager.dart';

const toolbarWidth = 32;

@Factory()
UiFactory<WindowTemplateProps> WindowTemplate;

@Props()
class WindowTemplateProps extends UiProps {
  // TODO: required annotations for props
  RegionManager head;
  RegionManager left;
  RegionManager body;
  RegionManager right;
  RegionManager foot;
}

@Component()
class WindowTemplateComponent extends UiComponent<WindowTemplateProps> {
  RegionTemplateComponent _leftRef;
  RegionTemplateComponent _bodyRef;
  RegionTemplateComponent _rightRef;

  /// Left panel width in px
  int leftWidth;

  /// Right panel width in px
  int rightWidth;

  @override
  void componentWillMount() {
    super.componentWillMount();

    leftWidth = 250; // TODO: smart default to device size
    rightWidth = 250; // TODO: smart default to device size
  }

  @override
  ReactElement render() {
    var childProps = copyUnconsumedProps();
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(childProps)
      ..add('main');
    return (Dom.div()..className = classNameBuilder.toClassName())(
      (Dom.div()..className = 'main-head')(
        (RegionTemplate()
          ..actions = props.head.actions
          ..location = RegionLocation.HEAD
          ..store = props.head)(),
      ),
      (TallToolbar()..isRightSide = false)(),
      _renderLeftPanel(),
      _renderBody(),
      _renderRightPanel(),
      (TallToolbar()..isRightSide = true)(),
    );
  }

  ReactElement _renderLeftPanel() => (Dom.div()
        ..className = 'main-region main-left'
        ..style = {
          'width': '${leftWidth}px',
        })(
        (ResizeBar()..hookRight = true)(),
        (RegionTemplate()
          ..actions = props.left.actions
          ..location = RegionLocation.LEFT
          ..ref = (ref) {
            _leftRef = ref;
          }
          ..store = props.left)(),
      );

  ReactElement _renderRightPanel() => (Dom.div()
        ..className = 'main-region main-right'
        ..style = {
          'width': '${rightWidth}px',
        })(
        (ResizeBar()..hookRight = false)(),
        (RegionTemplate()
          ..actions = props.right.actions
          ..location = RegionLocation.RIGHT
          ..ref = (ref) {
            _rightRef = ref;
          }
          ..store = props.right)(),
      );

  ReactElement _renderBody() =>
      (Dom.div()..className = 'main-region main-body'
      ..style = {
        'left': '${leftWidth+toolbarWidth}px',
        'right': '${rightWidth+toolbarWidth}px',
      })(
        (RegionTemplate()
          ..actions = props.body.actions
          ..location = RegionLocation.BODY
          ..ref = (ref) {
            _bodyRef = ref;
          }
          ..store = props.body)(),
      );
}
