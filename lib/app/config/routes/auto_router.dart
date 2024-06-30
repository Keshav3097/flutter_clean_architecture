import 'package:auto_route/auto_route.dart';

import 'auto_router.gr.dart';

@AutoRouterConfig()

class AppRouter extends $AppRouter{
  @override
  List<AutoRoute> get routes => [
   // AutoRoute(page: MyTaskRoute.page,initial:  true),
       // AutoRoute(path:'/details' page: TaskDetailsroute.page),

    
  ];
}