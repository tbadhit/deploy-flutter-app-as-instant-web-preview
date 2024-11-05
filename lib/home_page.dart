import 'package:flutter/material.dart';
import 'package:joks_app/content_detail_widget.dart';
import 'package:joks_app/detail_page.dart';
import 'package:joks_app/joke.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Joke? jokeChoosen;
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.sizeOf(context).width;
    final heightDevice = MediaQuery.sizeOf(context).height;
    final orientation = MediaQuery.orientationOf(context);
    print(widthDevice);
    print(heightDevice);
    print(orientation);
    late Widget content =
        widthDevice > 600 && orientation == Orientation.landscape
            ? Row(
                children: [
                  Flexible(
                      child: ListJokeWidget(
                    jokeChoosen: jokeChoosen,
                    onTap: (Joke joke) {
                      setState(() {
                        jokeChoosen = joke;
                      });
                    },
                  )),
                  Flexible(
                    child: ContentDetailWidget(joke: jokeChoosen),
                  ),
                ],
              )
            : ListJokeWidget(
                onTap: (joke) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        joke: joke,
                      ),
                    ),
                  );
                },
              );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: content,
    );
  }
}

class ListJokeWidget extends StatelessWidget {
  const ListJokeWidget({
    super.key,
    required this.onTap,
    this.jokeChoosen,
  });

  final void Function(Joke joke) onTap;
  final Joke? jokeChoosen;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokesList.length,
      itemBuilder: (BuildContext context, int index) {
        final joke = jokesList[index];
        return ListTile(
          title: Text(joke.setup),
          onTap: () {
            onTap(joke);
          },
          selected: jokeChoosen == joke,
        );
      },
    );
  }
}
