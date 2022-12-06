
import 'package:auto_route/auto_route.dart';
import 'package:martideas/main.dart';
import 'package:martideas/pages/auth/login_page.dart';
import 'package:martideas/pages/auth/signup_page.dart';
import 'package:martideas/pages/dashboard/pages/AddIdeasPage.dart';
import 'package:martideas/pages/dashboard/pages/account_page.dart';
import 'package:martideas/pages/dashboard/pages/liked_ideas_page.dart';

import '../pages/dashboard/dashboard_controller_page.dart';
import '../pages/dashboard/pages/home_page.dart';
import '../pages/dashboard/pages/idea_detail_page.dart';
import '../pages/dashboard/pages/trend_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: StarterPage,initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: SignupPage),
    AutoRoute(page: IdeaDetailPage),
    AutoRoute(
        path: '/dashboard',
        page: DashboardControllerPage,
        children: [
          AutoRoute(page: HomePage, path: ''),
          AutoRoute(page: TrendPage,),
          AutoRoute(page: AddIdeasPage),
          AutoRoute(page: LikedIdeasPage),
          AutoRoute(page: AccountPage),
        ]
    ),
  ],
)
class $AppRouter {}
