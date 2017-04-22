part of mtproj.lectern;

/// The "Homepage" of MT.
///
/// Its contents will likely differ drastically for ease of development.
@Factory()
UiFactory<ShellProps> Shell;

@Props()
class ShellProps extends UiProps {}

@Component()
class ShellComponent extends UiComponent {
  @override
  ReactElement render() => (Dom.div()..className = 'lectern__shell')();
}
