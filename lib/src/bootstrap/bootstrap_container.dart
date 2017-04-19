part of mtproj.bootstrap;

/// A Bootstrap "Container".
///
/// It contains the
@Factory()
UiFactory<ContainerProps> Container;

@Props()
class ContainerProps extends UiProps {
  bool fluid;
}

@Component()
class ContainerComponent extends UiComponent<ContainerProps> {
  @override
  ContainerProps getDefaultProps() => newProps()..fluid = false;

  @override
  ReactElement render() =>
      (Dom.div()..className = props.fluid ? 'container-fluid' : 'container')(
        props.children,
      );
}
