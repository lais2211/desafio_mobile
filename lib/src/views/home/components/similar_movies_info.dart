import 'package:desafio/src/domain/entities/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimilarMoviesInfo extends StatefulWidget {
  final Movie movie;
  const SimilarMoviesInfo({Key? key, required this.movie}) : super(key: key);

  @override
  State<SimilarMoviesInfo> createState() => _SimilarMoviesInfoState();
}

class _SimilarMoviesInfoState extends State<SimilarMoviesInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.network(
        widget.movie.imageUrl,
        height: 90,
      ),
      const SizedBox(
        width: 4,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(widget.movie.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
              softWrap: true,
              overflow: TextOverflow.ellipsis)
        ],
      ),
    ]);
  }
}
