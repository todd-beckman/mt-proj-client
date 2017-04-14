import 'package:over_react/over_react.dart';

@Factory()
UiFactory<HomeProps> Home;

@Props()
class HomeProps extends UiProps {
  String color;
}

@Component()
class HomeComponent extends UiComponent<HomeProps> {
  @override
  render() {
    return (Dom.div()
      ..style = {
        "color": props.color,
      })(props.children);
  }
}
