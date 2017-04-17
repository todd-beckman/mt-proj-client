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
    if (!props.store.isLoaded) {
      return (Dom.div()..className = 'homeloading')(
        Dom.p()('Loading...'),
      );
    }
    return (Dom.div()..className = 'home')(
      _renderGetButton(),
      _renderPostButton(),
      _renderBody(),
    );
  }

  ReactElement _renderGetButton() => Dom.div()(
        (Dom.button()
          ..className = 'getbutton'
          ..onClick = (_) => props.actions.loadDocument())(
          'Load Document',
        ),
      );

  ReactElement _renderPostButton() => Dom.div()(
        (Dom.button()
          ..className = 'postbutton'
          ..onClick = (_) => props.actions.sendDocument())(
          'Send Document',
        ),
      );

  ReactElement _renderBody() => (Dom.div()..className = 'homebody')(
        props.store.html,
      );
}
