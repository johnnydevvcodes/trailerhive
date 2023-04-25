import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/movie/movie.dart';
import '../../core/theme/app_colors.dart';

class Recommendations extends StatelessWidget {
  final List<Movie> recoMovies;
  const Recommendations({super.key, required this.recoMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: recoMovies.isNotEmpty
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recoMovies.isNotEmpty ? recoMovies.length : 10,
              itemBuilder: (context, index) {
                var movie = recoMovies[index];
                bool isFirst = index == 0;
                bool isLast = index == recoMovies.length - 1;
                return Container(
                  width: 84.0,
                  margin: EdgeInsets.fromLTRB(
                      isFirst ? 14 : 0, 0, isLast ? 14 : 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 84.0,
                          height: 84,
                          decoration: BoxDecoration(
                              // color: const Color(0xFF008EFF),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                          child: ClipOval(
                              child: CachedNetworkImage(
                                  imageUrl: movie.poster!, fit: BoxFit.cover))),
                      Text(
                        movie.title!,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
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
                return Container(
                    width: 84.0,
                    height: 84,
                    margin: EdgeInsets.fromLTRB(
                        isFirst ? 14 : 0, 0, isLast ? 14 : 0, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightGray,
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8);
              },
            ),
    );
  }
}
