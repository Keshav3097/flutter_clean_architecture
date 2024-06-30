import 'app/config/flavors/flavor.dart';
import 'package:flutter/material.dart';
import 'app/core/bootUp/injection_container.dart';
import 'main.dart';

void main() {

  Flavor.create(
    Environment.production,
    name: 'prod',
    properties: {
      Keys.apiUrl: 'https://swayam.jio.com',
      'devHttpBaseUrl': 'https://swayam.jio.com',
      'devHttpBaseIPUrl': 'https://swayam.jio.com',
      'devHttpsBaseUrl': 'https://swayam.jio.com',
      'login_host_address_port': 'https://swayam.jio.com',
    },
  );
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // bootstrap(App.new);
  runApp( MyApp());

}