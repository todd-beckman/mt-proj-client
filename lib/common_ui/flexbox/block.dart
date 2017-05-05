import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart';

/// A flexbox Block.
///
/// They will expand evenly horizontally and cover the full vertical area.
@Factory()
UiFactory<BlockProps> Block;

@Props()
class BlockProps extends UiProps {}

@Component()
class BlockComponent extends UiComponent<BlockProps> {
  @override
  ReactElement render() {
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(copyUnconsumedProps())
      ..add('flexbox-block');
    return (Dom.div()
      ..className = classNameBuilder.toClassName())(props.children);
  }
}
