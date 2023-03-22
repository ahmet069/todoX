// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on TaskStoreBase, Store {
  late final _$AllDataAtom =
      Atom(name: 'TaskStoreBase.AllData', context: context);

  @override
  List<Task> get AllData {
    _$AllDataAtom.reportRead();
    return super.AllData;
  }

  @override
  set AllData(List<Task> value) {
    _$AllDataAtom.reportWrite(value, super.AllData, () {
      super.AllData = value;
    });
  }

  late final _$UpdateDataAsyncAction =
      AsyncAction('TaskStoreBase.UpdateData', context: context);

  @override
  Future<void> UpdateData() {
    return _$UpdateDataAsyncAction.run(() => super.UpdateData());
  }

  late final _$TaskStoreBaseActionController =
      ActionController(name: 'TaskStoreBase', context: context);

  @override
  void setAllData(List<Task> newData) {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase.setAllData');
    try {
      return super.setAllData(newData);
    } finally {
      _$TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
AllData: ${AllData}
    ''';
  }
}
