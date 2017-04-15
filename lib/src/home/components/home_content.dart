part of mtproj.home;

/// The "Homepage" of MT.
///
/// Its contents will likely differ drastically for ease of development.
@Factory()
UiFactory<HomeProps> Home;

@Props()
class HomeProps extends FluxUiProps<HomeActions, HomeStore> {
  MTColor color;
}

@Component()
class HomeComponent extends FluxUiComponent<HomeProps> {
  @override
  void componentDidMount() {
    props.actions.loadDocument();
    super.componentWillMount();
  }

  @override
  ReactElement render() {
    return (Dom.div()
      ..className = 'home'
      ..style = {
        "color": props.color.toCssString(),
      })(props.store.html);
  }
}
