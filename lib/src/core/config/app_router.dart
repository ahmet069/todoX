import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:todox/src/view/details_view/details_view.dart';
import 'package:todox/src/view/home_veiw/home_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    CustomRoute(
      page: HomeView,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: DetailsView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
