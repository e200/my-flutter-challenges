import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TweetTextContent extends StatefulWidget {
  final String text;

  const TweetTextContent({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  _TweetTextContentState createState() => _TweetTextContentState();
}

class _TweetTextContentState extends State<TweetTextContent> {
  @override
  Widget build(BuildContext context) {
    return _buildRichTweet(widget.text);
  }

  Widget _buildRichTweet(String content) {
    final split = content.split('@');

    final _mentions = split.getRange(1, split.length).fold([], (t, e) {
      final _texts = e.split(' ');

      if (_texts.length > 1) {
        return List.from(t)
          ..addAll(
            ['@${_texts.first}', '${e.substring(_texts.first.length)}'],
          );
      }
      return List.from(t)..add('@${_texts.first}');
    });

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: split.first,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]..addAll(
            _mentions
                .map(
                  (text) => text.contains('@')
                      ? TextSpan(
                          text: text,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print(text);
                            },
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )
                      : TextSpan(
                          text: text,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                )
                .toList(),
          ),
      ),
    );
  }
}
