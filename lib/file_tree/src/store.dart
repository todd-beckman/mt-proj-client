import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mt_api/mt_api.dart' as api;
import 'package:w_flux/w_flux.dart';
import 'package:w_module/w_module.dart';

import 'package:mtproj/core/core.dart';

import 'api.dart';
import 'events.dart';

class FileTreeStore extends Store {
  FileTreeStore({
    @required AppContext this.appContext,
    @required FileTreeActions actions,
    @required DispatchKey dispatchKey,
    @required FileTreeEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    didDispose.then((_) {
      _actions = null;
      _events = null;
    });

    refresh();
  }

  final AppContext appContext;
  FileTreeActions _actions;
  FileTreeEvents _events;

  DispatchKey _dispatchKey;

  /// Whether the calls from the server have returned with data that can be rendered for the user.
  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  Future<Null> load() async {}

  void refresh() {
    _isLoaded = false;
  }

  api.FileMeta _buildMockFileTree() => new api.FileMeta()
    ..id = 'root'
    ..name = 'root'
    ..children = [
      new api.FileMeta()
        ..id = 'child1'
        ..name = 'An Enigmatic File'
        ..children = [],
      new api.FileMeta()
        ..id = 'child2'
        ..name = 'Some Directory'
        ..children = [
          new api.FileMeta()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new api.FileMeta()
        ..id = 'child6'
        ..name = 'Very Fancy Document'
        ..children = [],
      new api.FileMeta()
        ..id = 'child7'
        ..name = 'An Enigmatic File'
        ..children = [],
      new api.FileMeta()
        ..id = 'child8'
        ..name = 'Some Directory'
        ..children = [
          new api.FileMeta()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new api.FileMeta()
        ..id = 'child9'
        ..name = 'Very Fancy Document'
        ..children = [],
      new api.FileMeta()
        ..id = 'child10'
        ..name = 'An Enigmatic File'
        ..children = [],
      new api.FileMeta()
        ..id = 'child11'
        ..name = 'Some Directory'
        ..children = [
          new api.FileMeta()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new api.FileMeta()
        ..id = 'child12'
        ..name = 'Very Fancy Document'
        ..children = [
          new api.FileMeta()
            ..id = 'child16'
            ..name = 'An Enigmatic File'
            ..children = [],
          new api.FileMeta()
            ..id = 'child17'
            ..name = 'Some Directory'
            ..children = [],
          new api.FileMeta()
            ..id = 'child18'
            ..name = 'Very Fancy Document'
            ..children = [],
        ],
      new api.FileMeta()
        ..id = 'child13'
        ..name = 'An Enigmatic File'
        ..children = [
          new api.FileMeta()
            ..id = 'child16'
            ..name = 'An Enigmatic File'
            ..children = [],
          new api.FileMeta()
            ..id = 'child17'
            ..name = 'Some Directory'
            ..children = [
              new api.FileMeta()
                ..id = 'nestedchild1'
                ..name = 'A Nested Doc'
                ..children = [],
            ],
          new api.FileMeta()
            ..id = 'child18'
            ..name = 'Very Fancy Document'
            ..children = [],
        ],
      new api.FileMeta()
        ..id = 'child14'
        ..name = 'Some Directory'
        ..children = [
          new api.FileMeta()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new api.FileMeta()
        ..id = 'child15'
        ..name = 'Very Fancy Document'
        ..children = [],
      new api.FileMeta()
        ..id = 'child16'
        ..name = 'An Enigmatic File'
        ..children = [],
      new api.FileMeta()
        ..id = 'child17'
        ..name = 'Some Directory'
        ..children = [
          new api.FileMeta()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [
              new api.FileMeta()
                ..id = 'child16'
                ..name = 'An Enigmatic File'
                ..children = [
                  new api.FileMeta()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [
                      new api.FileMeta()
                        ..id = 'child16'
                        ..name = 'An Enigmatic File'
                        ..children = [],
                      new api.FileMeta()
                        ..id = 'child17'
                        ..name = 'Some Directory'
                        ..children = [
                          new api.FileMeta()
                            ..id = 'nestedchild1'
                            ..name = 'A Nested Doc'
                            ..children = [],
                        ],
                      new api.FileMeta()
                        ..id = 'child18'
                        ..name = 'Very Fancy Document'
                        ..children = [],
                    ],
                ],
              new api.FileMeta()
                ..id = 'child17'
                ..name = 'Some Directory'
                ..children = [
                  new api.FileMeta()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [],
                ],
              new api.FileMeta()
                ..id = 'child18'
                ..name = 'Very Fancy Document'
                ..children = [],
            ],
          new api.FileMeta()
            ..id = 'nestedchild'
            ..name = 'A Nested Doc'
            ..children = [
              new api.FileMeta()
                ..id = 'child16'
                ..name = 'An Enigmatic File'
                ..children = [],
              new api.FileMeta()
                ..id = 'child17'
                ..name = 'Some Directory'
                ..children = [
                  new api.FileMeta()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [],
                ],
              new api.FileMeta()
                ..id = 'child18'
                ..name = 'Very Fancy Document'
                ..children = [
                  new api.FileMeta()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [
                      new api.FileMeta()
                        ..id = 'child16'
                        ..name = 'An Enigmatic File'
                        ..children = [],
                      new api.FileMeta()
                        ..id = 'child17'
                        ..name = 'Some Directory'
                        ..children = [
                          new api.FileMeta()
                            ..id = 'nestedchild1'
                            ..name = 'A Nested Doc'
                            ..children = [],
                        ],
                      new api.FileMeta()
                        ..id = 'child18'
                        ..name = 'Very Fancy Document'
                        ..children = [],
                    ],
                ],
            ],
        ],
      new api.FileMeta()
        ..id = 'child18'
        ..name = 'Very Fancy Document'
        ..children = [],
    ];
}
