import 'package:flutter/material.dart';
import 'package:trailerhive/app/search/search_view.dart';
import 'package:trailerhive/core/utils/router.dart';

import '../../core/theme/app_colors.dart';
import '../widgets/cupertino_btn_slim.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.pink,
          automaticallyImplyLeading: true,
          title: Text('Search Movie', style: textTheme.titleLarge)),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: CupertinoButtonSlim(
                onPressed: () => context.toScreen(SearchScreen()),
                child: SearchView(didNavigate: true))),
        SliverFillRemaining(child: Text('Movies Empty')),
      ]),
    );
  }
}
