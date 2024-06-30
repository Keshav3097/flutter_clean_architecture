import 'app/config/flavors/flavor.dart';
import 'package:flutter/material.dart';
import 'app/core/bootUp/injection_container.dart';
import 'main.dart';

void main() {

  Flavor.create(
    Environment.sit,
    name: 'sit',
    properties: {
      Keys.apiUrl: 'https://kubesit.swayam.jio.com',
      'devHttpBaseUrl': 'http://kubesit.swayam.jio.com',
      'devHttpBaseIPUrl': 'https://10.169.141.8',
      'devHttpsBaseUrl': 'https://kubesit.swayam.jio.com',
      'login_host_address_port': 'sit.swayam.jio.com:3002',
    },
  );
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // bootstrap(App.new);
  runApp( MyApp());
}