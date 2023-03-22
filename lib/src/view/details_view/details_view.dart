import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todox/src/core/components/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:todox/src/core/store/color_palette.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width / 100;
    final h = size.height / 100;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorPalette.MainBackground,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: ColorPalette.MainBackground,
          ),
        ),
      ),
    );
  }
}
