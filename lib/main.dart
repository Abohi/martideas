import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/pages/auth/login_page.dart';
import 'app_routes/app_route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dependency_injection/controllers_injections.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}
final _appRouter = AppRouter();
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      minTextAdapt: true,
      builder: (context,widget) => MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(375, 812),
    );
  }
}

class StarterPage extends HookConsumerWidget {
  const StarterPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(ref.read(authControllerProvider)==null){
      context.router.navigate(const LoginRoute());
      return const SizedBox.shrink();
    }else{
      context.router.replaceAll([const DashboardControllerRoute()]);
      return const SizedBox.shrink();
    }
  }
}


