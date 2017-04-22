part of mtproj.lectern;

/// The "Homepage" of MT.
///
/// Its contents will likely differ drastically for ease of development.
@Factory()
UiFactory<LecternProps> Lectern;

@Props()
class LecternProps extends FluxUiProps<LecternActions, LecternStore> {}

@Component()
class LecternComponent extends FluxUiComponent<LecternProps> {
  @override
  ReactElement render() => Dom.div()(
        (TopBar())(
          (TopBarItem())('Some Link'),
          (TopBarItem())('Another One'),
          (TopBarItem())('Shtuff'),
        ),
        props.store.editorContent,
      );
}
