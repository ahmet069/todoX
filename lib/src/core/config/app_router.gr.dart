// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetailsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DetailsView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          DetailsRoute.name,
          path: '/details-view',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DetailsView]
class DetailsRoute extends PageRouteInfo<void> {
  const DetailsRoute()
      : super(
          DetailsRoute.name,
          path: '/details-view',
        );

  static const String name = 'DetailsRoute';
}
