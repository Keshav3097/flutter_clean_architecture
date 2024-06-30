import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app/config/flavors/flavor.dart';
import 'bootstrap.dart';

import 'app/core/bootUp/injection_container.dart';
import 'main.dart';

void main() {
  Flavor.create(Environment.dev, name: 'Dev', properties: {
    Keys.apiUrl: 'https://kubedev.swayam.jio.com',
    'devHttpBaseUrl': 'https.//kubedev.swayam.jio.com',
    'devHttpBaseIPUrl': 'https://10.169.141.4',
    'devHttpsBaseUrl': 'https://kubedev.swayam.jio.com',
    'login_host_address_port': 'https://kubedev.swayam.jio.com:3002/',
  },);
  Bloc.observer = MyBlocObserver();

  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();


  runApp( MyApp());
  // bootstrap(MyApp.new);
}


