part of mtproj.bootstrap;

/// A Bootstrap "Row".
///
/// It spans the width of its parent and can contain 12 total columns.
@Factory()
UiFactory<RowProps> Row;

@Props()
class RowProps extends UiProps {}

@Component()
class RowComponent extends UiComponent<RowProps> {
  @override
  ReactElement render() => (Dom.div()..className = 'row')(
        props.children,
      );
}
