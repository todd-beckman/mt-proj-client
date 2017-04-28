part of mtproj.editor;

@Factory()
UiFactory<EditorProps> Editor;

@Props()
class EditorProps extends FluxUiProps<EditorActions, EditorStore> {
  MTColor color;
}

@Component()
class EditorComponent extends FluxUiComponent<EditorProps> {
  @override
  void componentDidMount() {
    props.actions.loadDocument();
    super.componentWillMount();
  }

  @override
  ReactElement render() {
    if (!props.store.isLoaded) {
      return (Block()..className = 'et-body et-body--loading')(
        Dom.p()('Loading...'),
      );
    }
    return (Block()..className = 'et-body')(
      _renderGetButton(),
      _renderPostButton(),
      _renderBody(),
    );
  }

  ReactElement _renderGetButton() => Dom.div()(
        (Dom.button()
          ..className = 'et-body__load-button'
          ..onClick = (_) => props.actions.loadDocument())(
          'Load Document',
        ),
      );

  ReactElement _renderPostButton() => Dom.div()(
        (Dom.button()
          ..className = 'et-body__post-button'
          ..onClick = (_) => props.actions.saveDocument())(
          'Send Document',
        ),
      );

  ReactElement _renderBody() => (Dom.div()..className = 'et-body')(
        props.store.html,
      );
}
