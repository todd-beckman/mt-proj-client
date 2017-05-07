import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mt_api/mt_api.dart';
import 'package:w_flux/w_flux.dart';
import 'package:w_module/w_module.dart';

import 'package:mtproj/core/core.dart';

import 'api.dart';
import 'events.dart';

class FileTreeStore extends Store {
  final AppContext appContext;
  FileTreeActions _actions;
  FileTreeEvents _events;

  DispatchKey _dispatchKey;

  /// Whether the calls from the server have returned with data that can be rendered for the user.
  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  /// The root directory of the file tree
  File get root => _root;
  File _root;

  /// The map of files' id's to their data
  Map<String, File> get fileMap => _fileMap;
  Map<String, File> _fileMap;

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
      _fileMap = null;
    });

    refresh();
  }

  void refresh() {
    _isLoaded = false;
    _fileMap = {};
    _root = null;
  }

  Future<Null> load() async {
    String projectId = 'some-project-id';
    /*
    try {
      _root = await appContext.messenger.getFileTree('getFileTree');
    } catch (e) {
      print(e);
      return;
    }
    */
    _root = _buildMockFileTree();

    _isLoaded = true;
  }

  File _buildMockFileTree() => new File()
    ..id = 'root'
    ..name = 'root'
    ..children = [
      new File()
        ..id = 'child1'
        ..name = 'An Enigmatic File'
        ..children = [],
      new File()
        ..id = 'child2'
        ..name = 'Some Directory'
        ..children = [
          new File()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new File()
        ..id = 'child6'
        ..name = 'Very Fancy Document'
        ..children = [],
      new File()
        ..id = 'child7'
        ..name = 'An Enigmatic File'
        ..children = [],
      new File()
        ..id = 'child8'
        ..name = 'Some Directory'
        ..children = [
          new File()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new File()
        ..id = 'child9'
        ..name = 'Very Fancy Document'
        ..children = [],
      new File()
        ..id = 'child10'
        ..name = 'An Enigmatic File'
        ..children = [],
      new File()
        ..id = 'child11'
        ..name = 'Some Directory'
        ..children = [
          new File()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new File()
        ..id = 'child12'
        ..name = 'Very Fancy Document'
        ..children = [
          new File()
            ..id = 'child16'
            ..name = 'An Enigmatic File'
            ..children = [],
          new File()
            ..id = 'child17'
            ..name = 'Some Directory'
            ..children = [],
          new File()
            ..id = 'child18'
            ..name = 'Very Fancy Document'
            ..children = [],
        ],
      new File()
        ..id = 'child13'
        ..name = 'An Enigmatic File'
        ..children = [
          new File()
            ..id = 'child16'
            ..name = 'An Enigmatic File'
            ..children = [],
          new File()
            ..id = 'child17'
            ..name = 'Some Directory'
            ..children = [
              new File()
                ..id = 'nestedchild1'
                ..name = 'A Nested Doc'
                ..children = [],
            ],
          new File()
            ..id = 'child18'
            ..name = 'Very Fancy Document'
            ..children = [],
        ],
      new File()
        ..id = 'child14'
        ..name = 'Some Directory'
        ..children = [
          new File()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [],
        ],
      new File()
        ..id = 'child15'
        ..name = 'Very Fancy Document'
        ..children = [],
      new File()
        ..id = 'child16'
        ..name = 'An Enigmatic File'
        ..children = [],
      new File()
        ..id = 'child17'
        ..name = 'Some Directory'
        ..children = [
          new File()
            ..id = 'nestedchild1'
            ..name = 'A Nested Doc'
            ..children = [
              new File()
                ..id = 'child16'
                ..name = 'An Enigmatic File'
                ..children = [
                  new File()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [
                      new File()
                        ..id = 'child16'
                        ..name = 'An Enigmatic File'
                        ..children = [],
                      new File()
                        ..id = 'child17'
                        ..name = 'Some Directory'
                        ..children = [
                          new File()
                            ..id = 'nestedchild1'
                            ..name = 'A Nested Doc'
                            ..children = [],
                        ],
                      new File()
                        ..id = 'child18'
                        ..name = 'Very Fancy Document'
                        ..children = [],
                    ],
                ],
              new File()
                ..id = 'child17'
                ..name = 'Some Directory'
                ..children = [
                  new File()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [],
                ],
              new File()
                ..id = 'child18'
                ..name = 'Very Fancy Document'
                ..children = [],
            ],
          new File()
            ..id = 'nestedchild'
            ..name = 'A Nested Doc'
            ..children = [
              new File()
                ..id = 'child16'
                ..name = 'An Enigmatic File'
                ..children = [],
              new File()
                ..id = 'child17'
                ..name = 'Some Directory'
                ..children = [
                  new File()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [],
                ],
              new File()
                ..id = 'child18'
                ..name = 'Very Fancy Document'
                ..children = [
                  new File()
                    ..id = 'nestedchild1'
                    ..name = 'A Nested Doc'
                    ..children = [
                      new File()
                        ..id = 'child16'
                        ..name = 'An Enigmatic File'
                        ..children = [],
                      new File()
                        ..id = 'child17'
                        ..name = 'Some Directory'
                        ..children = [
                          new File()
                            ..id = 'nestedchild1'
                            ..name = 'A Nested Doc'
                            ..children = [],
                        ],
                      new File()
                        ..id = 'child18'
                        ..name = 'Very Fancy Document'
                        ..children = [],
                    ],
                ],
            ],
        ],
      new File()
        ..id = 'child18'
        ..name = 'Very Fancy Document'
        ..children = [],
    ];
}
