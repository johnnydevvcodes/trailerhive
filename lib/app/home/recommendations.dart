import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trailerhive/app/detail/detail_screen.dart';
import 'package:trailerhive/app/widgets/cupertino_btn_slim.dart';
import 'package:trailerhive/core/utils/router.dart';

import '../../core/movie/movie.dart';
import '../../core/theme/app_colors.dart';

class Recommendations extends StatefulWidget {
  final List<Movie> recoMovies;
  const Recommendations({super.key, required this.recoMovies});

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: widget.recoMovies.isNotEmpty
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount:
                  widget.recoMovies.isNotEmpty ? widget.recoMovies.length : 10,
              itemBuilder: (context, index) {
                var movie = widget.recoMovies[index];
                bool isFirst = index == 0;
                bool isLast = index == widget.recoMovies.length - 1;
                return Container(
                    width: 100,
                    margin: EdgeInsets.fromLTRB(
                        isFirst ? 24 : 0, 0, isLast ? 24 : 0, 0),
                    child: _buildItem(movie));
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8);
              },
            )
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                bool isFirst = index == 0;
                bool isLast = index == 9;
                return Column(
                  children: [
                    Container(
                        width: 100,
                        height: 130,
                        margin: EdgeInsets.fromLTRB(
                            isFirst ? 24 : 0, 0, isLast ? 24 : 0, 0),
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        )),
                    SizedBox(height: 4),
                    Container(
                        width: 100,
                        height: 20,
                        margin: EdgeInsets.fromLTRB(
                            isFirst ? 24 : 0, 0, isLast ? 24 : 0, 0),
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5))),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8);
              },
            ),
    );
  }

  Widget _buildItem(Movie movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoButtonSlim(
          onPressed: () => context.toScreen(DetailScreen(movie)),
          child: Container(
              width: 100,
              height: 150,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: CachedNetworkImage(
                      alignment: Alignment.topCenter,
                      imageUrl: movie.poster!,
                      fit: BoxFit.cover))),
        ),
        SizedBox(height: 4),
        Text(
          movie.title!,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
