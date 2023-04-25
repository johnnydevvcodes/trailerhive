import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trailerhive/app/detail/detail_screen.dart';
import 'package:trailerhive/core/theme/app_colors.dart';
import 'package:trailerhive/core/utils/router.dart';

import '../../core/movie/movie.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  final bool isFromSearch;
  const MovieCard(this.movie, {this.isFromSearch = false}) : super();

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  Movie get _movie => widget.movie;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: () => context.toScreen(DetailScreen(widget.movie)),
      child: widget.isFromSearch
          ? SizedBox(
              height: 80,
              child: Card(
                elevation: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          child: CachedNetworkImage(
                            alignment: Alignment.center,
                            imageUrl: widget.movie.poster!,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                Container(color: AppColors.lightBrown),
                          )),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18),
                          Text(_movie.title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: textTheme.bodyLarge),
                          SizedBox(height: 4),
                          AutoSizeText(widget.movie.year!,
                              minFontSize: 10,
                              maxLines: 1,
                              style: textTheme.bodyMedium!
                                  .copyWith(color: AppColors.darkGray)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, color: AppColors.darkGray),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            )
          : SizedBox(
              height: 150,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                        width: 140,
                        height: 150,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            child: CachedNetworkImage(
                                alignment: Alignment.center,
                                imageUrl: widget.movie.poster!,
                                errorWidget: (context, url, error) =>
                                    Container(color: AppColors.lightBrown),
                                fit: BoxFit.cover))),
                    SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18),
                          Text(_movie.title!, style: textTheme.bodyLarge),
                          SizedBox(height: 4),
                          AutoSizeText(widget.movie.year!,
                              minFontSize: 10,
                              maxLines: 1,
                              style: textTheme.bodyMedium!
                                  .copyWith(color: AppColors.darkGray)),
                          SizedBox(height: 18),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: AutoSizeText(widget.movie.imdb!.actor!,
                                  minFontSize: 8,
                                  maxLines: null,
                                  style: textTheme.bodyMedium!
                                      .copyWith(color: AppColors.darkGray)),
                            ),
                          ),
                          SizedBox(height: 18),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            ),
    );
  }
}
