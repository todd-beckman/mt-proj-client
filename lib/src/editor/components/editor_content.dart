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
      return (Dom.div()..className = 'editorloading')(
        Dom.p()('Loading...'),
      );
    }
    return (Dom.div()..className = 'editor')(
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
          ..onClick = (_) => props.actions.saveDocument())(
          'Send Document',
        ),
      );

  ReactElement _renderBody() => (Dom.div()..className = 'editorbody')(
        props.store.html,
      );
}
