import 'package:flutter/material.dart';
import 'package:trailerhive/core/theme/app_theme.dart';
import 'app/home/home_screen.dart';
import 'core/di/service_locator.dart';
import 'data/service/rest_instance.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Rest.initialize();
  setupLocator();
  runApp(const TrailerHive());
}

class TrailerHive extends StatelessWidget {
  const TrailerHive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trailer Hive',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: const HomeScreen(),
    );
  }
}
