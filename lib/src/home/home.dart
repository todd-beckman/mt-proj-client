part of mtproj.home;

class MTHome {
  ReactElement get content {
    return (Home()..color = 'red')(
      'some sweet content',
    );
  }
}
