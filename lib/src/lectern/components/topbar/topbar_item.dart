part of mtproj.lectern;

@Factory()
UiFactory<TopBarItemProps> TopBarItem;

@Props()
class TopBarItemProps extends UiProps {}

@Component()
class TopBarItemComponent extends UiComponent<TopBarItemProps> {
  @override
  ReactElement render() {
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(props)
      ..add('lectern__top-bar-item');
    return (Block()..className = classNameBuilder.toClassName())(
      (Dom.button()..className = 'lectern__top-bar-button')(
        props.children,
      ),
    );
  }
}
