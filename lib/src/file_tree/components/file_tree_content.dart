part of mtproj.file_tree;

@Factory()
UiFactory<LecternProps> Lectern;

@Props()
class LecternProps extends FluxUiProps<FileTreeActions, FileTreeStore> {}

@Component()
class LecternComponent extends FluxUiComponent<LecternProps> {
  @override
  ReactElement render() => (Dom.div()..className = 'ft-block')(
        (Dom.ul()..className = 'ft-list')(
          _renderItems(),
        ),
      );

  ReactElement _renderItems() {
    var list = props.store.files.map(
      (File file) => (Dom.div()
            ..key = file.id
            ..className = 'ft-list__file')(
            file.displayName,
          ),
    );
  }
}
