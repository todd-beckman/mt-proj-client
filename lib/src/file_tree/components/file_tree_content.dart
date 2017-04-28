part of mtproj.file_tree;

@Factory()
UiFactory<FileTreeProps> FileTree;

@Props()
class FileTreeProps extends FluxUiProps<FileTreeActions, FileTreeStore> {}

@Component()
class FileTreeComponent extends FluxUiComponent<FileTreeProps> {
  @override
  ReactElement render() => (Block()..className = 'ft-body')(
        (Dom.ul()..className = 'ft-list')(
          _renderItems(),
        ),
      );

  _renderItems() => props.store.files.map(
        (File file) => (Dom.li()
              ..key = file.id
              ..className = 'ft-list__file')(
              file.displayName,
            ),
      );
}
