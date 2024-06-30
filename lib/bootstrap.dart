import 'dart:async';
import 'dart:io';
// import 'package:catcher/core/catcher.dart';
// import 'package:catcher/handlers/console_handler.dart';
// import 'package:catcher/mode/silent_report_mode.dart';
// import 'package:catcher/model/catcher_options.dart';
// import 'package:catcher/model/report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'app/config/routes/auto_router.dart';

import 'app/core/bootUp/bootup.dart';
import 'app/core/bootUp/injection_container.dart';

class MyBlocObserver extends BlocObserver {
  // @override
  // void onCreate(BlocBase bloc) {
  //   super.onCreate(bloc);
  //   debugPrint('onCreate -- ${bloc.runtimeType}');
  // }

  // @override
  // void onEvent(Bloc bloc, Object? event) {
  //   super.onEvent(bloc, event);
  //   debugPrint('onEvent -- ${bloc.runtimeType}, $event');
  // }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   debugPrint('onChange -- ${bloc.runtimeType}, $change');
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onClose(BlocBase bloc) {
  //   super.onClose(bloc);
  //   debugPrint('onClose -- ${bloc.runtimeType}');
  // }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final appRouter = AppRouter();

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  // log('boostrap run1');
  /// this function body is written in bootUp.dart file
  /// it will call setupGetIt function

  await AppStartConfig.shared.startApp();

  setUpLocator();
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  /*
    * This will make splash screen lasts for the duration of the delay task.
    * 300ms looks well for me, can adjust based on your preference.
  */
  bindings.deferFirstFrame();
  GestureBinding.instance.resamplingEnabled = true;

  if (!kIsWeb && Platform.isAndroid) {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } on PlatformException {
      // log('FlutterDisplayMode exception: ${exception.toString()}');
    }
  }

  bindings.allowFirstFrame();
  //await Future.delayed(const Duration(milliseconds: 300), () {,});
  FlutterError.onError = (details) {
    // log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = MyBlocObserver();

  ///setPathUrlStrategy in commented for reload issue in kube
  // setPathUrlStrategy();
  // final CatcherOptions debugOptions = CatcherOptions(
  //   //CustomErrorPageReportMode(),
  //   //DialogReportMode(),
  //   SilentReportMode(),
  //   [/*PageReportMode(), */ ConsoleHandler()],
  //   filterFunction: (Report report) {
  //     if (report.error is ArgumentError) {
  //       return false;
  //     } else {
  //       return true;
  //     }
  //   },
  // );
  // final CatcherOptions releaseOptions = CatcherOptions(
  //   //CustomErrorPageReportMode(),
  //   //DialogReportMode(),
  //   //PageReportMode(),
  //   SilentReportMode(),
  //   [/*PageReportMode(), */ ConsoleHandler()],
  //   filterFunction: (Report report) {
  //     if (report.error is ArgumentError) {
  //       return false;
  //     } else {
  //       return true;
  //     }
  //   },
  // );
  // Catcher(
  //   rootWidget: await builder(),
  //   debugConfig: debugOptions,
  //   releaseConfig: releaseOptions,
  //  // navigatorKey: appRouter.navigatorKey,
  // );
  // return;
}
class AppStartConfig {
  AppStartConfig._privateConstructor();

  static var shared = AppStartConfig._privateConstructor();

  Future<void> startApp() async {
    /// this functions body is written in injection_container.dart
    // setupGetIt();
  }
}