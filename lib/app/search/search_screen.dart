import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trailerhive/app/movie_store.dart';
import 'package:trailerhive/app/search/search_view.dart';
import 'package:trailerhive/core/utils/router.dart';

import '../../core/di/service_locator.dart';
import '../../core/theme/app_colors.dart';
import '../home/movie_card.dart';
import '../widgets/cupertino_btn_slim.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _movieStore = locator<MovieStore>();
  @override
  void dispose() {
    _movieStore.searchMovie('');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.pink,
          automaticallyImplyLeading: true,
          title: Text('Search Movie', style: textTheme.titleLarge)),
      body: Observer(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverAppBar(
                  leadingWidth: 0,
                  backgroundColor: Colors.white,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: SearchView(
                    didNavigate: true,
                    onChanged: _movieStore.searchMovie,
                  )),
              SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(22, 0, 22, 8),
                  child: MovieCard(_movieStore.searchedMovies[index],
                      isFromSearch: true),
                );
              }, childCount: _movieStore.searchedMovies.length)),
              if (_movieStore.isSearching)
                SliverToBoxAdapter(
                  child: Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator.adaptive()),
                ),
              if (!_movieStore.isSearching)
                SliverToBoxAdapter(
                  child: Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      child: Text(_movieStore.searchedMovies.isEmpty
                          ? 'No Movies'
                          : 'No More Movies')),
                ),
            ],
          );
        },
      ),
    );
  }
}
