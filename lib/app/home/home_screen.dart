import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trailerhive/app/home/recommendations.dart';
import 'package:trailerhive/app/movie_store.dart';
import 'package:trailerhive/app/search/search_screen.dart';
import 'package:trailerhive/app/search/search_view.dart';
import 'package:trailerhive/core/di/service_locator.dart';
import 'package:trailerhive/core/utils/router.dart';

import '../../core/theme/app_colors.dart';
import '../widgets/cupertino_btn_slim.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _movieStore = locator<MovieStore>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.pink,
          automaticallyImplyLeading: false,
          title: Text('Trailer Hive',
              style: Theme.of(context).textTheme.titleLarge)),
      body: Observer(
        builder: (BuildContext context) {
          var savedMovies = _movieStore.savedMovies;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverAppBar(
                  leadingWidth: 0,
                  backgroundColor: Colors.white,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: CupertinoButtonSlim(
                      onPressed: () => context.toScreen(SearchScreen()),
                      child: SearchView())),
              SliverAppBar(
                  backgroundColor: Colors.white,
                  title: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Recommendations',
                          style: textTheme.titleMedium))),
              SliverToBoxAdapter(
                  child: Recommendations(recoMovies: _movieStore.recoMovies)),
              SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  title: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Your Saves', style: textTheme.titleMedium))),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      height: 100.0,
                      child: Card(
                        child: Text('data'),
                      ),
                    );
                  },
                  childCount: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100.0,
                  alignment: Alignment.center,
                  child: Text('No Movies'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
