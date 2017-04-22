part of mtproj.lectern;

@Factory()
UiFactory<TopBarProps> TopBar;

@Props()
class TopBarProps extends UiProps {
  LecternActions actions;
}

@Component()
class TopBarComponent extends UiComponent<TopBarProps> {
  @override
  ReactElement render() {
    var classNameBuilder = new ClassNameBuilder()
      ..addFromProps(props)
      ..add('lectern__top-bar');
    return (Container()..className = classNameBuilder.toClassName())(
      props.children,
    );
  }
}
