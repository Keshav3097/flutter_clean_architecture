import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // let's assume that user is authenticated
    const authenticated = true;
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authenticated) {
      // if user is authenticated, continue
      resolver.next(true);
    } 
    // else {
    //   // we redirect the user to our login page
    //   router.push(LoginRoute(onResult: (success) {
    //     // if success == true the navigation will be resumed
    //     // else it will be aborted
    //     resolver.next(success);
    //   }));
    // }
  }
}