import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strings/strings.dart';
import 'package:trailerhive/app/movie_store.dart';
import 'package:trailerhive/core/movie/movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/di/service_locator.dart';
import '../../core/theme/app_colors.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen(
    this.movie, {
    super.key,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  var _movieStore = locator<MovieStore>();
  bool isSaved = false;

  bool _isFullScreen = false;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.movie.youtubeId!,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          showLiveFullscreenButton: false),
    )..addListener(listener);

    _idController = TextEditingController();
    _seekToController = TextEditingController();
    isSaved = _movieStore.savedMovies.contains(widget.movie);
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              backgroundColor: AppColors.pink,
              automaticallyImplyLeading: true,
              title: Text('Movie Details', style: textTheme.titleLarge)),
      body: Column(
        children: [
          Flexible(child: player()),
          SizedBox(height: 24),
          if (!_isFullScreen)
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 18),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      height: 150,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: CachedNetworkImage(
                              alignment: Alignment.topCenter,
                              imageUrl: widget.movie.poster!,
                              fit: BoxFit.cover))),
                  SizedBox(width: 18),
                  Expanded(
                      child: Column(
                    children: [
                      SizedBox(
                          child: Text(
                              camelize("${widget.movie.title!}").toString(),
                              style: textTheme.titleMedium!
                                  .copyWith(color: Colors.black))),
                      SizedBox(height: 12),
                      _buildInfoItem(
                          label: "Year", valueString: widget.movie.imdb!.year!),
                      SizedBox(height: 4),
                      _buildInfoItem(
                          label: "Runtime",
                          valueString: widget.movie.imdb!.runtime!),
                      SizedBox(height: 4),
                      _buildInfoItem(
                          label: "Genre",
                          valueString: widget.movie.imdb!.genre!),
                      SizedBox(height: 4),
                      _buildInfoItem(
                          label: "Director",
                          valueString: widget.movie.imdb!.director!),
                      SizedBox(height: 4),
                      _buildInfoItem(
                          label: "Actor",
                          valueString: widget.movie.imdb!.actor!),
                    ],
                  )),
                  SizedBox(width: 18),
                ],
              ),
            ),
          if (!_isFullScreen)
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (isSaved) {
                          await _unsave();
                        } else {
                          await _save();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSaved ? AppColors.lightBrown : AppColors.pink,
                        padding: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      child: Text(
                        isSaved ? 'Unsave' : 'Save',
                        style: textTheme.titleMedium!.copyWith(
                            color: isSaved ? AppColors.darkGray : Colors.white),
                      )),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget player() {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.pink,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {},
        onEnded: (data) {},
      ),
      builder: (context, player) => player,
    );
  }

  Widget _buildInfoItem(
      {String? label, Widget? valueWidget, String? valueString}) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (label != null)
          SizedBox(
              width: 64,
              child: Text(camelize("$label:").toString(),
                  style: textTheme.titleSmall!.copyWith(color: Colors.black))),
        SizedBox(width: 12),
        Flexible(
            child: valueWidget ??
                Text(camelize("$valueString").toString(),
                    maxLines: 2,
                    style: textTheme.bodyMedium!
                        .copyWith(color: AppColors.darkGray))),
      ],
    );
  }

  Future<void> _save() async {
    bool isSuccess = await _movieStore.saveMovie(widget.movie);
    if (isSuccess) {
      _showToast("Movie Saved");
      setState(() {
        isSaved = true;
      });
    }
  }

  Future<void> _unsave() async {
    bool isSuccess = await _movieStore.unsaveMovie(widget.movie);
    if (isSuccess) {
      _showToast("Movie Unsaved");
      setState(() {
        isSaved = false;
      });
    }
  }

  void listener() {
    if (mounted)
      setState(() {
        _isFullScreen = _controller.value.isFullScreen;
      });
  }

  void _showToast(String s) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(s),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: 100,
            left: 12,
            right: 12,
          ),
        ),
      );
  }
}
