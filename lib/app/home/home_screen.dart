import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trailerhive/app/movie_store.dart';
import 'package:trailerhive/core/di/service_locator.dart';

import '../../core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _movieStore = locator<MovieStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.pink,
          automaticallyImplyLeading: false,
          title: Text('Trailer Hive',
              style: Theme.of(context).textTheme.titleLarge)),
      body: Observer(
        builder: (BuildContext context) {
          _movieStore.movies;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Text('Search')),
              SliverToBoxAdapter(child: Text('Empty Recommendation')),
              SliverToBoxAdapter(child: Text('Empty Saves')),
            ],
          );
        },
      ),
    );
  }
}
