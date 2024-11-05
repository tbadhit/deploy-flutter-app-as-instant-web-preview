import 'package:flutter/material.dart';
import 'package:joks_app/content_detail_widget.dart';
import 'package:joks_app/joke.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.joke});

  final Joke? joke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? 'no selected type'),
      ),
      body: ContentDetailWidget(joke: joke),
    );
  }
}
