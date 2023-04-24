import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.pink,
          automaticallyImplyLeading:true,
          title: Text('Your Saves', style: textTheme.titleLarge)),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Text('Sort by [field]')),
        SliverFillRemaining(child: Text('Saves Empty')),
      ]),
    );
  }
}
