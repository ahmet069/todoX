import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todox/src/core/components/add_item_dialog.dart';
import 'package:todox/src/core/components/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:todox/src/core/service/db_service.dart';
import 'package:todox/src/core/mob_x/task_store.dart';
import 'package:todox/src/view/home_veiw/widget/task_area.dart';
import 'package:todox/src/view/home_veiw/widget/task_counter.dart';

import '../../core/store/color_palette.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DBService db_service = DBService();
  List<Color> colorsList = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
  ];
  late var _task;
  @override
  void initState() {
    super.initState();
    _task = TextEditingController();
    // db_service.addTask(
    //   Task(id: 10, task: 'daw', date: 'ad', importance_level: 'adaw'),
    // );
  }

  AddItemDialog addItemDialog = AddItemDialog();

  @override
  Widget build(BuildContext context) {
    final task_store = Provider.of<TaskStore>(context);
    SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      statusBarBrightness: Brightness.dark,
    );
    final size = MediaQuery.of(context).size;
    final w = size.width / 100;
    final h = size.height / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false, // klavye açılma hatasını düzeltir
      drawerScrimColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorPalette.MainBackground,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          height: 100 * h,
          width: 100 * w,
          decoration: BoxDecoration(
            color: ColorPalette.MainBackground,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: w * 100,
                  alignment: Alignment.center,
                  child: Text(
                    'My Task',
                    style: GoogleFonts.jomhuria(
                      color: Colors.white,
                      fontSize: 65,
                    ),
                  ),
                ),
                TaskCounter(),
                TaskArea(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 65,
            height: 65,
            child: FloatingActionButton(
              backgroundColor: ColorPalette.floatActionColor,
              onPressed: () async {
                await addItemDialog.addTaskDialog(
                  context: context,
                  taskDescription: _task,
                  updateDataFnc: task_store.UpdateData,
                  color: '',
                );
                _task =
                    TextEditingController(); // yeni task nesnesi oluşturulur
                print('bitti');
                task_store.UpdateData();
              },
              child: Icon(
                Icons.add,
                size: 38,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
