import 'package:mobx/mobx.dart';
import 'package:todox/src/core/service/db_service.dart';
import '../models/task_model.dart';
part 'task_store.g.dart';

class TaskStore = TaskStoreBase with _$TaskStore;

abstract class TaskStoreBase with Store {
  DBService db_service = DBService();
  @observable
  late List<Task> AllData = [];

  @action
  void setAllData(List<Task> newData) {
    AllData = newData;
  }

  @action
  Future<void> UpdateData() async {
    print("data updated");
    await db_service.getAllTask().then((value) => AllData = value!);
  }
}
