import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

import 'package:mtproj/common_ui/flexbox.dart';

import 'region_template.dart';
import '../region_manager.dart';

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
  @override
  ReactElement render() {
    var childProps = copyUnconsumedProps();
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(childProps)
      ..add('main');
    return (Container()
      ..className = classNameBuilder.toClassName()
      ..vertical = true)(
      (Block()..className = 'main-region main-head')((RegionTemplate()
        ..location = RegionLocation.HEAD
        ..store = props.head
        ..actions = props.head.actions)()),
      (Container()..className = 'main-middle')(
        (Block()..className = 'main-region main-left')(
          (RegionTemplate()
            ..location = RegionLocation.LEFT
            ..store = props.left
            ..actions = props.left.actions)(),
        ),
        (Block()..className = 'main-region main-body')(
          (RegionTemplate()
            ..location = RegionLocation.BODY
            ..store = props.body
            ..actions = props.body.actions)(),
        ),
        (Block()..className = 'main-region main-right')(
          (RegionTemplate()
            ..location = RegionLocation.RIGHT
            ..store = props.right
            ..actions = props.right.actions)(),
        ),
      ),
      (Block()..className = 'main-region main-foot')(
        (RegionTemplate()
          ..location = RegionLocation.FOOT
          ..store = props.foot
          ..actions = props.foot.actions)(),
      ),
    );
  }
}
