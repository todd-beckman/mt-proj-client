part of mtproj.flexbox;

/// Wraps flex content
@Factory()
UiFactory<ContainerProps> Container;

@Props()
class ContainerProps extends UiProps {
  bool vertical;
}

@Component()
class ContainerComponent extends UiComponent {
  @override
  ContainerProps getDefaultProps() => newProps()..vertical = false;

  @override
  ReactElement render() {
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(copyUnconsumedProps())
      ..add(
          props.vertical ? 'flexbox-container-vertical' : 'flexbox-container');
    return (Dom.div()
      ..className = classNameBuilder.toClassName())(props.children);
  }
}
