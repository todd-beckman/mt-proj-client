part of mtproj.bootstrap;

/// A Bootstrap "Row".
///
/// It spans the width of its parent and can contain 12 total columns.
@Factory()
UiFactory<ColProps> Col;

@Props()
class ColProps extends UiProps {
  /// The column width out of 12 for extra small devices (<768px).
  int xs;

  /// Optionally the column width out of 12 for small devices (>=768px <992px); otherwise inherits xs.
  int sm;

  /// Optionally the column width out of 12 for medium devices (>=992px <1200px); otherwise inherits sm.
  int md;

  /// Optionally the column width out of 12 for large devices (>=1200px); otherwise inherits md.
  int lg;
}

@Component()
class ColComponent extends UiComponent<ColProps> {
  String _className;

  @override
  ColProps getDefaultProps() => newProps()..xs = 1;

  @override
  componentWillMount() {
    _className = _getClassName();
    super.componentWillMount();
  }

  @override
  ReactElement render() => (Dom.div()..className = _className)(
        props.children,
      );

  String _getClassName() {
    List<String> classes = [];
    if (props.xs != null) {
      'col-xs-${props.xs}';
    }
    if (props.sm != null) {
      classes.add('col-sm-${props.sm}');
    }
    if (props.md != null) {
      classes.add('col-md-${props.md}');
    }
    if (props.lg != null) {
      classes.add('col-lg-${props.lg}');
    }

    return classes.join(' ');
  }
}
