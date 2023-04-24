import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.pink,
          automaticallyImplyLeading: true,
          title: Text('Movie Details', style: textTheme.titleLarge)),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Text('Movie Deets')),
        SliverToBoxAdapter(child: Text('Movie Trailer')),
        SliverFillRemaining(child: Text('Movie stats')),
      ]),
    );
  }
}
