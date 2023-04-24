import 'package:flutter/material.dart';
import 'package:trailerhive/core/theme/app_colors.dart';
import 'package:trailerhive/core/theme/app_theme.dart';
import 'app/home/home_screen.dart';

void main() {
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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.pink,
          automaticallyImplyLeading: false,
          title: Text('Trailer Hive', style: textTheme.titleLarge)),
      body: HomeScreen(),
    );
  }
}
