import 'package:flutter/material.dart';
import 'package:trailerhive/app/home/movie_card.dart';

import '../../core/movie/movie.dart';
import '../../core/theme/app_colors.dart';

class SaveList extends StatefulWidget {
  final List<Movie> movies;
  const SaveList(this.movies, {super.key});

  @override
  State<SaveList> createState() => _SaveListState();
}

class _SaveListState extends State<SaveList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        bool isFirst = index == 0;
        bool isLast = index == 9;
        return Container(
            margin:
                EdgeInsets.fromLTRB(isFirst ? 24 : 0, 0, isLast ? 24 : 0, 0),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: MovieCard(widget.movies[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 8);
      },
    );
  }
}
