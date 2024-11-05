import 'package:flutter/material.dart';
import 'package:joks_app/joke.dart';

class ContentDetailWidget extends StatelessWidget {
  const ContentDetailWidget({
    super.key,
    required this.joke,
  });

  final Joke? joke;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(joke?.setup ?? ' No setup'),
              const SizedBox(
                height: 10,
              ),
              Text(joke?.punchline ?? 'No punchline'),
            ],
          ),
        ),
      ),
    );
  }
}
