import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../../app_routes/app_route.gr.dart';
import '../../../../state_managers/state_providers/tabRouterStateProvider.dart';
import '../../widgets/dashboard_widgets/custom_bottom_nav_bar.dart';


class DashboardControllerPage extends HookConsumerWidget {
  const DashboardControllerPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var tabRouteState = ref.read(tabRouteStateProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AutoTabsRouter(
          routes: const [HomeRoute(),TrendRoute(),AddIdeasRoute(),LikedIdeasRoute(),AccountRoute()],
          duration: const Duration(milliseconds: 400),
          builder: (context, child, animation) {
            final tabsRouter = context.tabsRouter;
            WidgetsBinding.instance
                .addPostFrameCallback((_){
              if(ref.read(tabRouteStateProvider)==null){
                ref.read(tabRouteStateProvider.notifier).state = tabsRouter;
              }
            });
            return Scaffold(
              body: Stack(children: [
                FadeTransition(child: child, opacity: animation),
                Positioned(
                    bottom: 0,
                    child: CustomBottomNavigationBar())]),
            );
          },
        ),
      ),
    );
  }
}
