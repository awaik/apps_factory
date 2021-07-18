import 'package:apps_factory/app/domain/track/track_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackWidget extends StatelessWidget {
  final TrackModel track;

  const TrackWidget({Key? key, required this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    track.name,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.time),
                      const SizedBox(width: 6),
                      Text(
                          '${track.duration ~/ 60}:${track.duration % 60 > 9 ? "" : "0"}${track.duration % 60}'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
