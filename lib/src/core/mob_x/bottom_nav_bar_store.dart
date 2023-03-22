import 'package:mobx/mobx.dart';
part 'bottom_nav_bar_store.g.dart';

class BottomNavBarStore = BottomNavBarStoreBase with _$BottomNavBarStore;

abstract class BottomNavBarStoreBase with Store {
  @override
  late int currentIndex = 0;

  @action
  void changeCurrentIndex(int newIndex) {
    currentIndex = newIndex;
  }
}
