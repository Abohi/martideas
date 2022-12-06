// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../main.dart' as _i1;
import '../models/ideas_model/create_ideas_model.dart' as _i13;
import '../pages/auth/login_page.dart' as _i2;
import '../pages/auth/signup_page.dart' as _i3;
import '../pages/dashboard/dashboard_controller_page.dart' as _i5;
import '../pages/dashboard/pages/account_page.dart' as _i10;
import '../pages/dashboard/pages/AddIdeasPage.dart' as _i8;
import '../pages/dashboard/pages/home_page.dart' as _i6;
import '../pages/dashboard/pages/idea_detail_page.dart' as _i4;
import '../pages/dashboard/pages/liked_ideas_page.dart' as _i9;
import '../pages/dashboard/pages/trend_page.dart' as _i7;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    StarterRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.StarterPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SignupPage(),
      );
    },
    IdeaDetailRoute.name: (routeData) {
      final args = routeData.argsAs<IdeaDetailRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.IdeaDetailPage(createIdeaModel: args.createIdeaModel),
      );
    },
    DashboardControllerRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.DashboardControllerPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    TrendRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.TrendPage(),
      );
    },
    AddIdeasRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AddIdeasPage(),
      );
    },
    LikedIdeasRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.LikedIdeasPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AccountPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          StarterRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i11.RouteConfig(
          SignupRoute.name,
          path: '/signup-page',
        ),
        _i11.RouteConfig(
          IdeaDetailRoute.name,
          path: '/idea-detail-page',
        ),
        _i11.RouteConfig(
          DashboardControllerRoute.name,
          path: '/dashboard',
          children: [
            _i11.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: DashboardControllerRoute.name,
            ),
            _i11.RouteConfig(
              TrendRoute.name,
              path: 'trend-page',
              parent: DashboardControllerRoute.name,
            ),
            _i11.RouteConfig(
              AddIdeasRoute.name,
              path: 'add-ideas-page',
              parent: DashboardControllerRoute.name,
            ),
            _i11.RouteConfig(
              LikedIdeasRoute.name,
              path: 'liked-ideas-page',
              parent: DashboardControllerRoute.name,
            ),
            _i11.RouteConfig(
              AccountRoute.name,
              path: 'account-page',
              parent: DashboardControllerRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.StarterPage]
class StarterRoute extends _i11.PageRouteInfo<void> {
  const StarterRoute()
      : super(
          StarterRoute.name,
          path: '/',
        );

  static const String name = 'StarterRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SignupPage]
class SignupRoute extends _i11.PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '/signup-page',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i4.IdeaDetailPage]
class IdeaDetailRoute extends _i11.PageRouteInfo<IdeaDetailRouteArgs> {
  IdeaDetailRoute({required _i13.CreateIdeaModel createIdeaModel})
      : super(
          IdeaDetailRoute.name,
          path: '/idea-detail-page',
          args: IdeaDetailRouteArgs(createIdeaModel: createIdeaModel),
        );

  static const String name = 'IdeaDetailRoute';
}

class IdeaDetailRouteArgs {
  const IdeaDetailRouteArgs({required this.createIdeaModel});

  final _i13.CreateIdeaModel createIdeaModel;

  @override
  String toString() {
    return 'IdeaDetailRouteArgs{createIdeaModel: $createIdeaModel}';
  }
}

/// generated route for
/// [_i5.DashboardControllerPage]
class DashboardControllerRoute extends _i11.PageRouteInfo<void> {
  const DashboardControllerRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardControllerRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardControllerRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.TrendPage]
class TrendRoute extends _i11.PageRouteInfo<void> {
  const TrendRoute()
      : super(
          TrendRoute.name,
          path: 'trend-page',
        );

  static const String name = 'TrendRoute';
}

/// generated route for
/// [_i8.AddIdeasPage]
class AddIdeasRoute extends _i11.PageRouteInfo<void> {
  const AddIdeasRoute()
      : super(
          AddIdeasRoute.name,
          path: 'add-ideas-page',
        );

  static const String name = 'AddIdeasRoute';
}

/// generated route for
/// [_i9.LikedIdeasPage]
class LikedIdeasRoute extends _i11.PageRouteInfo<void> {
  const LikedIdeasRoute()
      : super(
          LikedIdeasRoute.name,
          path: 'liked-ideas-page',
        );

  static const String name = 'LikedIdeasRoute';
}

/// generated route for
/// [_i10.AccountPage]
class AccountRoute extends _i11.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account-page',
        );

  static const String name = 'AccountRoute';
}
