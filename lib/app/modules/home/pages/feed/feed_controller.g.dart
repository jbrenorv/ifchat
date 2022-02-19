// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedControllerBase, Store {
  Computed<dynamic>? _$nextComputed;

  @override
  dynamic get next => (_$nextComputed ??=
          Computed<dynamic>(() => super.next, name: '_FeedControllerBase.next'))
      .value;

  final _$initAsyncAction = AsyncAction('_FeedControllerBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_FeedControllerBaseActionController =
      ActionController(name: '_FeedControllerBase');

  @override
  void _next() {
    final _$actionInfo = _$_FeedControllerBaseActionController.startAction(
        name: '_FeedControllerBase._next');
    try {
      return super._next();
    } finally {
      _$_FeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
next: ${next}
    ''';
  }
}
